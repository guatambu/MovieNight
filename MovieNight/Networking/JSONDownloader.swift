//
//  JSONDownloader.swift
//  MovieNight
//
//  Created by MIchael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

class JSONDownloader {
    
    let urlRequestSession: URLSession
    let stringURLSession: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.urlRequestSession = URLSession(configuration: configuration)
        self.stringURLSession = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    typealias JSON = [String: AnyObject]
    
    typealias JSONTaskCompletionHandler = (JSON?, ErrorsTMDBAPI?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSessionDataTask {
        let task = urlRequestSession.dataTask(with: request) {data, response, error in
            // Convert to HTTP response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed(message: "the network request failed"))
                print(ErrorsTMDBAPI.requestFailed(message: "the network request failed"))
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure(message: "there was an error in the JSON data conversion"))
                        print(ErrorsTMDBAPI.jsonConversionFailure(message: "there was an error in the JSON data conversion"))
                    }
                } else{
                    completion(nil, .invalidData(message: "the data is invlaid"))
                    print(ErrorsTMDBAPI.invalidData(message: "the data is invlaid"))
                }
            } else {
                completion(nil, .responseUnsuccessful(message: "response unsuccessful"))
                print(ErrorsTMDBAPI.responseUnsuccessful(message: "response unsuccessful"))
            }
        }
        return task
    }
    
}
