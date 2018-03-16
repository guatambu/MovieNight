//
//  MovieDatabaseAPIClient.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation


class MovieDatabaseAPIClient {

    fileprivate enum DiscoverOptions: String {
        case apiKey = "9d2b65148c48ec092a601516a168a71b"
        case languageEnglishUS = "en-US"
        case sortByDescendingPopularity = "popularity.desc"
        case sortByAscendingPopularity = "popularity.asc"
        case isTrue = "true"
        case isFalse = "false"
        case page1 = "1"
    }
    
    let downloader = JSONDownloader()
    let session = URLSession.shared
    
    var discoverEndpoint = TMDBAPI.moviesInGenreWithPerson(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, sortBy: DiscoverOptions.sortByDescendingPopularity.rawValue, includeAdult: DiscoverOptions.isFalse.rawValue, includeVideo: DiscoverOptions.isFalse.rawValue, page: DiscoverOptions.page1.rawValue, withGenreID: <#T##String?#>, people: <#T##String?#>)
    
    var popularPeopleEndpoint = TMDBAPI.person(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, page: DiscoverOptions.page1.rawValue)
    
    var pageNumber = 2
    
    var allDiscoverJSON = [String: Any]()
    var allPeopleJSON = [String: Any]()
    
    var allDownloadedMovies = [Movie]()
    var allDownloadedPeople = [Person]()
    
    typealias MoviesCompletionHandler = ([Movie], ErrorsTMDBAPI?) -> Void
    typealias PeopleCompletionHandler = ([Person], ErrorsTMDBAPI?) -> Void

    func discover(with movieDBEntityEntityURLPath: Endpoint, completionHandler completion: @escaping MoviesCompletionHandler) {
        let task = downloader.jsonTask(with: discoverEndpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], ErrorsTMDBAPI.noJSONData(message: "no JSON Data - failed at MovieDatabaseAPIClient.swift line 41?"))
                    print(ErrorsTMDBAPI.noJSONData(message: "no JSON Data - failed at MovieDatabaseAPIClient.swift line 41?"))
                    return
                }
                self.allDiscoverJSON = json
                guard let results = self.allDiscoverJSON["results"] as? [[String: Any]] else {
                    completion([], ErrorsTMDBAPI.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(ErrorsTMDBAPI.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }
                let movies: [Movie] = results.flatMap { Movie(json: $0) }
                //let sortedMovies: [Starship] = starships.sorted(by: {$1.name > $0.name})
                self.allDownloadedStarships.append(contentsOf: movies/*sortedMovies*/)
                let totalPages = json["total_pages"]
                if totalPages > 1 || totalPages < 6 {
                    self.discoverEndpoint = TMDBAPI.moviesInGenreWithPerson(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, sortBy: DiscoverOptions.sortByDescendingPopularity.rawValue, includeAdult: DiscoverOptions.isFalse.rawValue, includeVideo: DiscoverOptions.isFalse.rawValue, page: ("\(pageNumber)"), withGenreID: "<#T##String?#>", people: "<#T##String?#>")
                    self.discover(with: self.discoverEndpoint, completionHandler: completion)
                    self.pageNumber += 1
                } else {
                    self.discoverEndpoint = TMDBAPI.moviesInGenreWithPerson(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, sortBy: DiscoverOptions.sortByDescendingPopularity.rawValue, includeAdult: DiscoverOptions.isFalse.rawValue, includeVideo: DiscoverOptions.isFalse.rawValue, page: ("\(pageNumber)"), withGenreID: "<#T##String?#>", people: "<#T##String?#>")
                    print("endpoint has been reset to: \(self.discoverEndpoint)")
                    self.pageNumber = 2
                    print("\(self.pageNumber)")
                    self.allDiscoverJSON = [:]
                }
                //self.allDownloadedMovies = self.allDownloadedMovies.sorted(by: {$1.name > $0.name})
                completion(movies, nil)
            }
        }
        task.resume()
    }
    
    
    
    func getPopularPeople(with movieDBEntityEntityURLPath: Endpoint, completionHandler completion: @escaping PeopleCompletionHandler) {
        let task = downloader.jsonTask(with: popularPeopleEndpoint.request) { json, error in
            DispatchQueue.main.async {
                guard let json = json else {
                    completion([], ErrorsTMDBAPI.noJSONData(message: "no JSON Data - failed at MovieDatabaseAPIClient.swift line 84?"))
                    print(ErrorsTMDBAPI.noJSONData(message: "no JSON Data - failed at MovieDatabaseAPIClient.swift line 84?"))
                    return
                }
                self.allPeopleJSON = json
                guard let results = self.allPeopleJSON["results"] as? [[String: Any]] else {
                    completion([], ErrorsTMDBAPI.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    print(ErrorsTMDBAPI.jsonParsingFailure(message: "failed attempt to parse JSON data - JSON data does not contain 'results'"))
                    return
                }
                let people: [Person] = results.flatMap { Person(json: $0) }
                //let sortedMovies: [Starship] = starships.sorted(by: {$1.name > $0.name})
                self.allDownloadedPeople.append(contentsOf: people/*sortedMovies*/)
                let totalPages = json["total_pages"]
                if totalPages > 1 || totalPages < 6 {
                    self.discoverEndpoint = TMDBAPI.person(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, page: "\(pageNumber)")
                    self.getPopularPeople(with: self.popularPeopleEndpoint, completionHandler: completion)
                    self.pageNumber += 1
                } else {
                    self.popularPeopleEndpoint = TMDBAPI.person(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, page: DiscoverOptions.page1.rawValue)
                    print("endpoint has been reset to: \(self.popularPeopleEndpoint)")
                    self.pageNumber = 2
                    print("\(self.pageNumber)")
                    self.allPeopleJSON = [:]
                }
                //self.allDownloadedPeople = self.allDownloadedPeople.sorted(by: {$1.name > $0.name})
                completion(people, nil)
            }
        }
        task.resume()
    }
}














