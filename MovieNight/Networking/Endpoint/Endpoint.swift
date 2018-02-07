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
-> ?
api_key=9d2b65148c48ec092a601516a168a71b
-> &
 
 *** query items -> key = value pairs available ***
 
 -> language=en-US
 
 
2) ***** List of Popular People to choose from URL *****

API base URL:  https://api.themoviedb.org/3/
path:  person/popular
-> ?
api_key=9d2b65148c48ec092a601516a168a71b
-> &

 *** query items -> key = value pairs available ***

 -> language=en-US
 -> &
 -> page=1

    *** Person Profile Pic URL for popular person list ***

    image base URL: https://image.tmdb.org/t/p/
    image size path: w500
    image poster_path: /kqjL17yufvn9OVLyXYpvtyrFfak.jpg
 

3) ***** List Of Movies With Genre And Person To Choose From URL:
 
API base URL: https://api.themoviedb.org/3/
path: discover/movie
-> ?
api_key=9d2b65148c48ec092a601516a168a71b
-> &
 
 *** query items -> key = value pairs available ***
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
-> ?
api_key=9d2b65148c48ec092a601516a168a71b


******




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
    case movieGenreList
    case person
    case moviesInGenreWithPerson(page: String?)
    case movie
}

extension TMDBAPI: Endpoint {
 
    var baseImages: String {
        return "https://image.tmdb.org/t/p/"
    }
 
    var pathImages: String {
        switch self{
        case .small: return "w185"
        case .big: return "original"
        }
    }
    var base: String {
        return "https://api.themoviedb.org/3/"
    }
    
    fileprivate var api_key: String {
        return "9d2b65148c48ec092a601516a168a71b"
    }
    
    var path: String {
        switch self {
        case .movieGenreList: return "/genre/movie/list"
        case .person: return "person/popular"
        case .moviesInGenreWithPerson: return "discover/movie"
        case .movie: return "movie/"
        }
    }
 
    var queryItems: [URLQueryItem] {
        switch self {
        case .movieGenreList(let language):
            var result = [URLQueryItem]()
 
            if let language = language {
                let chosenLanguage = URLQueryItem(name: /*key*/ "language", value: en-US
                result.append(chosenLanguage)
            }
 
            if let sort_by = sort_by {
                let wayToSort = URLQueryItem(name: /*key*/ "sort_by", value: popularity.desc
                result.append(wayToSort)
            }
 
            if let include_adult = include_adult {
                let isAdult = URLQueryItem(name: /*key*/ "include_adult", value: false
                result.append(isAdult)
            }
 
            if let include_video = include_video {
                let isVideo = URLQueryItem(name: /*key*/ "include_video", value: false
                result.append(isVideo)
            }
 
            if let page = page {
                let pageNumebr = URLQueryItem(name: /*key*/ "page", value: page
                result.append(pageNumber)
            }
 
            if let with_genre = with_genre {
                let genreID = URLQueryItem(name: /*key*/ "with_genre", value: <GENRE_ID#>
                result.append(genreID)
            }
 
            if let people = people {
                let personID = URLQueryItem(name: /*key*/ "with_people", value: <PEOPLE_ID#>
                result.append(personID)
            }
        return result
 
        case .person:
            var result = ""
            return result
 
        case .moviesInGenreWithPerson(let page):
            var result = [URLQueryItem]()
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            return result

        case .movie:
            var result = ""
            return result
    }
    
}
 

 
******
Images URL info
 
movie posters have an image path called: "poster_path"

 person profile pics have an image path called:  "profile_path"
******
 
enum TMDBImagesAPI {
    case small
    case large
}
 
protocol ImageEndpoint {
    var base: String { get }
    var sizePath: String { get }
}


extension ImageEndpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.sizePath = sizePath

        return components
    }

    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

 
 */
 
 
 
 
 
 
 
