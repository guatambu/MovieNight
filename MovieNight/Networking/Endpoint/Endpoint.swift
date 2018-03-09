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
         * sort path: sort_by=
         * sort options: popularity.asc/desc, release_date.asc/desc, revenue.asc/desc, vote_average.asc/desc, vote_count.asc/desc, created_at.asc/desc <-(genre only)
 -> &
 -> include_adult=false
 -> &
 -> include_video=false
 -> &
 -> page=2
 -> &
 -> with_genres=35
        * one can chain genres using commas - which means 'AND' - without whitespace like this:  with_genres=878,18
 -> &
 -> with_people=53
        * one can chain people using commas - which means 'AND' - without whitespace like this:  with_people=54,98,101
 

4) ***** Full URL for a specific movie: *****
 
API base URL:  https://api.themoviedb.org/3/
path:  movie/
movie id: <Movie_ID#>
 
 *** query items -> key = value pairs available ***
 
-> ?
api_key=9d2b65148c48ec092a601516a168a71b
 
******

*/


struct Movie1 {
    let langauge: String = "en-US"
    let sortBy: String = "pop.desc"
    let includeAdult: String = "false"
    let includeVideo: String = "false"
    let page: String = "12"
    let withGenreID: String = "28"
    let people: String = "53"
    let movieID: String = "12"
}

let myMovie = Movie1()


protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
    
}

fileprivate var apiKey: String {
    return "9d2b65148c48ec092a601516a168a71b"
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
    case moviesInGenreWithPerson(apiKey: String?, language: String?, sortBy: String?, includeAdult: String?, includeVideo: String?, page: String?, withGenreID: String?, people: String?)
    case movie(movieID: String, apiKey: String, language: String)
}

extension TMDBAPI: Endpoint {
    
    var base: String {
        return "https://api.themoviedb.org/3"
    }
    
    
    
    var path: String {
        switch self {
        case .movieGenreList: return "/genre/movie/list"
        case .person: return "/person/popular"
        case .moviesInGenreWithPerson: return "/discover/movie"
        case .movie(let id): return "/movie/\(id.movieID)"
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
                let chosenLanguage = URLQueryItem(name: "language", value: language)
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
                let chosenLanguage = URLQueryItem(name: "language", value: language)
                result.append(chosenLanguage)
            }
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            
            return result
            
        case .moviesInGenreWithPerson(let apiKey, let language, let sortBy, let includeAdult, let includeVideo, let page, let withGenreID, let people):
            
            var result = [URLQueryItem]()
            
            if let apiKey = apiKey {
                let apiKeyValue = URLQueryItem(name: "apiKey", value: apiKey)
                result.append(apiKeyValue)
            }
            
            if let language = language {
                let chosenLanguage = URLQueryItem(name: "language", value: language)
                result.append(chosenLanguage)
            }
            
            if let sortBy = sortBy {
                let wayToSort = URLQueryItem(name: "sort_by", value: sortBy)
                result.append(wayToSort)
            }
            
            if let includeAdult = includeAdult {
                let isAdult = URLQueryItem(name: "include_adult", value: includeAdult)
                result.append(isAdult)
            }
            
            if let includeVideo = includeVideo {
                let isVideo = URLQueryItem(name: "include_video", value: includeVideo)
                result.append(isVideo)
            }
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            
            if let withGenreID = withGenreID {
                let genreID = URLQueryItem(name: "with_genre", value: withGenreID)
                result.append(genreID)
            }
            
            if let people = people {
                let personID = URLQueryItem(name: "with_people", value: people)
                result.append(personID)
            }
            
            return result
            
        case .movie(let movieID, let apiKey, let language):
            var result = [URLQueryItem]()
            
            let movieIDValue = URLQueryItem(name: "movieID", value: movieID)
            
            let apiKeyValue = URLQueryItem(name: "apiKey", value: apiKey)
            result.append(apiKeyValue)
            
            
            
            let chosenLanguage = URLQueryItem(name: "language", value: language)
            result.append(chosenLanguage)
            
            return result
        }
        
    }
    
}

 

// about the TMDBAPI discover/movie tool/path...
// it allows for multiple queries on a single parameter separated by either a ',' or '|'
// ',' allows for an AND type search which is more specific, honing the search to the very item(s) that fit(s) the TOTAL combination of the search's criteria sorted in descending order by the popularity rating... most popular first
// '|' allows for an OR type search which will be a grab bag of all matching parameters included returning everything that hits any one or all of the parameters and returns results sorted in descending order by the popularity rating... most popular first
// if there results are numerous enough, then the results will be returned paginated with 20 returned results per page
 
 
 
 
 
 
