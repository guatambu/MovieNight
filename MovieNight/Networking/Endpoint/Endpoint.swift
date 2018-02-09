//
//  Endpoint.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

/*

*** Movie Database API key ***
    
    api_key = 9d2b65148c48ec092a601516a168a71b

******

URL including components (examples)
 

1) ***** Full URL for comprehensive list of movie genres:
 
API base URL: https://api.themoviedb.org/3/
path: genre/movie/list

 
 *** query items -> key = value pairs available ***
 
 -> ?
 api_key=9d2b65148c48ec092a601516a168a71b
 -> &
 -> language=en-US
 
 
2) ***** List of Popular People to choose from URL *****

API base URL:  https://api.themoviedb.org/3/
path:  person/popular


 *** query items -> key = value pairs available ***
 
 -> ?
 api_key=9d2b65148c48ec092a601516a168a71b
 -> &
 -> language=en-US
 -> &
 -> page=1
 

3) ***** List Of Movies With Genre And Person To Choose From URL:
 
API base URL: https://api.themoviedb.org/3/
path: discover/movie
 
 *** query items -> key = value pairs available ***
 
 -> ?
 api_key=9d2b65148c48ec092a601516a168a71b
 -> &
 -> language=en-US
 -> &
 -> sort_by=popularity.desc
 -> &
 -> include_adult=false
 -> &
 -> include_video=false
 -> &
 -> page=2
 -> &
 -> with_genres=35
 -> &
 -> with_people=53

    * sort path: sort_by=
    * sort options: popularity.asc/desc, release_date.asc/desc, revenue.asc/desc, vote_average.asc/desc, vote_count.asc/desc, created_at.asc/desc <-(genre only)
 

4) ***** Full URL for a specific movie: *****
 
API base URL:  https://api.themoviedb.org/3/
path:  movie/
movie id: <Movie_ID#>
 
 *** query items -> key = value pairs available ***
 
-> ?
api_key=9d2b65148c48ec092a601516a168a71b
 
******

*/


protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    
}


extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.queryItems = queryItems
        
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum TMDBAPI {
    case movieGenreList(apiKey: String?, language: String?)
    case person(apiKey: String?, language: String?, page: String?)
    case moviesInGenreWithPerson(apiKey: String?, language: String?, sortBy: String?, includeAdult: String?, includeVideo: String?, page: String?, withGenre: String?, people: String?)
    case movie(apiKey: String?, language: String?)
}

extension TMDBAPI: Endpoint {
 
    var base: String {
        return "https://api.themoviedb.org/3/"
    }
    
    fileprivate var apiKey: String {
        return "9d2b65148c48ec092a601516a168a71b"
    }
    
    var path: String {
        switch self {
        case .movieGenreList: return "/genre/movie/list"
        case .person: return "person/popular"
        case .moviesInGenreWithPerson: return "discover/movie"
        case .movie(let movieID): return "movie/\(movieID)"
        }
    }
 
 
    var queryItems: [URLQueryItem] {
        switch self {
 
        case .movieGenreList(let apiKey, let language):
 
            var result = [URLQueryItem]()

            if let apiKey = apiKey {
                let apiKeyValue = URLQueryItem(name: "apiKey", value: apiKey)
                result.append(apiKeyValue)
            }
 
            if let language = language {
                let chosenLanguage = URLQueryItem(name: "language", value: "en-US")
                result.append(chosenLanguage)
            }
 
            return result
 
        case .person(let apiKey, let language, let page):
 
            var result = [URLQueryItem]()

            if let apiKey = apiKey {
                let apiKeyValue = URLQueryItem(name: "apiKey", value: apiKey)
                result.append(apiKeyValue)
            }
 
            if let language = language {
                let chosenLanguage = URLQueryItem(name: "language", value: "en-US")
                result.append(chosenLanguage)
            }
 
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
 
            return result
 
        case .moviesInGenreWithPerson(let apiKey, let language, let sortBy, let includeAdult, let includeVideo, let page, let withGenre, let people):
 
            var result = [URLQueryItem]()
 
            if let apiKey = apiKey {
                let apiKeyValue = URLQueryItem(name: "apiKey", value: apiKey)
                result.append(apiKeyValue)
            }
 
            if let language = language {
                let chosenLanguage = URLQueryItem(name: "language", value: "en-US")
                result.append(chosenLanguage)
            }
 
            if let sortBy = sortBy {
                let wayToSort = URLQueryItem(name: "sort_by", value: "popularity.desc")
                result.append(wayToSort)
            }
 
            if let includeAdult = includeAdult {
                let isAdult = URLQueryItem(name: "include_adult", value: "false")
                result.append(isAdult)
            }
 
            if let includeVideo = includeVideo {
                let isVideo = URLQueryItem(name: "include_video", value: "false")
                result.append(isVideo)
            }
 
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
 
            if let withGenre = withGenre {
                let genreID = URLQueryItem(name: "with_genre", value: "/*<GENRE_ID#>*/")
                result.append(genreID)
            }
 
            if let people = people {
                let personID = URLQueryItem(name: "with_people", value: "/*<PEOPLE_ID#>*/")
                result.append(personID)
            }
 
            return result

        case .movie(let apiKey, let language):
            var result = [URLQueryItem]()
 
            if let apiKey = apiKey {
                let apiKeyValue = URLQueryItem(name: "apiKey", value: apiKey)
                result.append(apiKeyValue)
            }
 
            if let language = language {
                let chosenLanguage = URLQueryItem(name: "language", value: "en-US")
                result.append(chosenLanguage)
            }
            return result
        }
    
    }

}

 

 
 
 
 
 
 
 
