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
    
    var neutralMovieResultsEndpoint = TMDBAPI.moviesInGenreWithPerson(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, sortBy: DiscoverOptions.sortByDescendingPopularity.rawValue, includeAdult: DiscoverOptions.isFalse.rawValue, includeVideo: DiscoverOptions.isFalse.rawValue, page: DiscoverOptions.page1.rawValue, withGenreID: "", people: "")
    var popularPeopleEndpoint = TMDBAPI.person(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, page: DiscoverOptions.page1.rawValue)
    
    var pageNumber = 2
    
    var allDiscoverJSON = [String: Any]()
    var allPeopleJSON = [String: Any]()
    
    var allDownloadedMovies = [Movie]()
    var allDownloadedPeople = [Person]()
    
    typealias MoviesCompletionHandler = ([Movie], ErrorsTMDBAPI?) -> Void
    typealias PeopleCompletionHandler = ([Person], ErrorsTMDBAPI?) -> Void

    func discoverMovies(with movieDBEntityURLPath: Endpoint, completionHandler completion: @escaping MoviesCompletionHandler) {
        let task = downloader.jsonTask(with: movieDBEntityURLPath.request) { json, error in
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
                print(results)
                //var movies = [Movie]()
                //for movie in results {
                //    guard let mov = Movie(json: movie) else {
                //        print("can't create a Movie object to save my life MovieDataBaseAPIClient line 59")
                //        return
                //    }
                //    movies.append(mov)
                //}
                self.allDownloadedMovies.append(contentsOf: movies)
                
                //let totalPages: Int = json["total_pages"] as! Int
                if self.pageNumber < 6 {
                    self.discoverMovies(with: movieDBEntityURLPath, completionHandler: completion)
                    self.pageNumber += 1
                } else {
                    print("endpoint has been reset to: \(self.neutralMovieResultsEndpoint)")
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
    
    
    
    func getPopularPeople(with movieDBEntityURLPath: Endpoint, completionHandler completion: @escaping PeopleCompletionHandler) {
        print(popularPeopleEndpoint.request)
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
                //let people: [Person] = results.flatMap { Person(json: $0 )}
                var people = [Person]()
                for person in results {
                    guard let peep = Person(json: person) else {
                        print("can't create a Person object to save my life MovieDataBaseAPIClient line 101")
                        return
                    }
                    people.append(peep)
                }
                
                //let sortedPeople: [Person] = people.sorted(by: {$1.name > $0.name})
                self.allDownloadedPeople.append(contentsOf: people/*sortedPeople*/)
                //let totalPages: Int = json["total_pages"] as! Int
                
                if self.pageNumber < 6 {
                    self.popularPeopleEndpoint = TMDBAPI.person(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, page: "\(self.pageNumber)")
                    self.getPopularPeople(with: self.popularPeopleEndpoint, completionHandler: completion)
                    self.pageNumber += 1
                } else {
                    self.popularPeopleEndpoint = TMDBAPI.person(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, page: DiscoverOptions.page1.rawValue)
                    print("endpoint has been reset to: \(self.popularPeopleEndpoint)")
                    self.pageNumber = 2
                    print("pageNumber reset to: \(self.pageNumber)")
                    self.allPeopleJSON = [:]
                }
                //print("***************\nhere is your people object array:\n\(self.allDownloadedPeople)")
                
                //self.allDownloadedPeople = self.allDownloadedPeople.sorted(by: {$1.name > $0.name})
                completion(people, nil)
            }
        }
        task.resume()
    }
}














