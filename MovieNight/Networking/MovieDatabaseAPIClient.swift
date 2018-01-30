//
//  MovieDatabaseAPIClient.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation


class MovieDatabaseAPIClient {

    /*
    
    let downloader = JSONDownloader()
    let session = URLSession.shared
    
    var starshipsEndpoint = SWAPI.spaceships(page: nil)
    
    var pageNumber = 2
    
    var allStarshipsJSON = [String: Any]()
    
    var allDownloadedStarships = [Starship]()
    
    typealias StarshipsCompletionHandler = ([Starship], Errors_API_Awakens?) -> Void

    func getStarships(with starWarsEntityURLPath: Endpoint, completionHandler completion: @escaping StarshipsCompletionHandler) {
        let task = downloader.jsonTask(with: starshipsEndpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    //self.findBigAndSmall.currentLengthDictionaryMaker(current: self.allDownloadedStarships)
                    //self.findBigAndSmall.findLargestAndSmallest(current: self.findBigAndSmall.myDictionary)
                    completion([], Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 87?"))
                    print(Errors_API_Awakens.noJSONData(message: "no JSON Data - failed at StarWarsAPIClient.swift line 87?"))
                    return
                }
                self.allStarshipsJSON = json
                guard let results = self.allStarshipsJSON["results"] as? [[String: Any]] else {
                    completion([], .jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(Errors_API_Awakens.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }
                let starships: [Starship] = results.flatMap { Starship(json: $0) }
                let sortedStarships: [Starship] = starships.sorted(by: {$1.name > $0.name})
                self.allDownloadedStarships.append(contentsOf: sortedStarships)
                let next = json["next"]
                if next != nil {
                    self.starshipsEndpoint = SWAPI.spaceships(page: "\(self.pageNumber)")
                    self.getStarships(with: self.starshipsEndpoint, completionHandler: completion)
                    self.pageNumber += 1
                } else {
                    self.starshipsEndpoint = SWAPI.spaceships(page: nil)
                    print("endpoint has been reset to: \(self.starshipsEndpoint)")
                    self.pageNumber = 2
                    print("\(self.pageNumber)")
                    self.allStarshipsJSON = [:]
                }
                self.allDownloadedStarships = self.allDownloadedStarships.sorted(by: {$1.name > $0.name})
                completion(sortedStarships, nil)
            }
        }
        task.resume()
    }
 */
}
