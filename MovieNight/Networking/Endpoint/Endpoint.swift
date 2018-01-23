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

URL components (examples)

base URL: https://api.themoviedb.org/3
genre path: /genre
movie path: /movie
person path: /person
genre/movie/person id path: /Integer
start of URL query item path: ?
additional query items path: &
api key path: api_key=<<api_key>>

language path: language=
chosen language path ex. : language=en-US
adult movies path: include_adult=BOOLEAN

sort path: sort_by=
sort options: popularity.asc/desc, release_date.asc/desc, revenue.asc/desc, vote_average.asc/desc, vote_count.asc/desc, created_at.asc/desc <-(genre only)

image base URL: https://image.tmdb.org/t/p/
image size path: w500
image poster_path: /kqjL17yufvn9OVLyXYpvtyrFfak.jpg

full URL for a specific movie:
https://api.themoviedb.org/3/movie/550?api_key=<<api_key>>

full URL for a specific list of movies in a genre:
https://api.themoviedb.org/3/genre/{genre_id: Integer}/movies?api_key=<<api_key>>&language=en-US&include_adult=false&sort_by=created_at.asc

full URL for comprehensive list of movie genres:
https://api.themoviedb.org/3/genre/movie/list?api_key=<<api_key>>&language=en-US

full URL for a specifuc person/actor/director:
https://api.themoviedb.org/3/person/10?api_key=<<api_key>>&language=en-US

full URL for a specific image:
https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg


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

enum SWAPI {
    case films(page: String?)
    case people(page: String?)
    case planets(page: String?)
    case spaceships(page: String?)
    case species(page: String?)
    case vehicles(page: String?)
}

extension SWAPI: Endpoint {
    var base: String {
        return "https://swapi.co"
    }
    
    var path: String {
        switch self {
        case .films: return "/api/films/"
        case .people: return "/api/people/"
        case .planets: return "/api/planets/"
        case .spaceships: return "/api/starships/"
        case .species: return "/api/species/"
        case .vehicles: return "/api/vehicles/"
        }
    }
    
    var queryItems: [URLQueryItem] {
        switch self {
        case .films(let page):
            var result = [URLQueryItem]()
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            return result
            
        case .people(let page):
            var result = [URLQueryItem]()
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            return result
            
        case .planets(let page):
            var result = [URLQueryItem]()
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            return result
            
        case .spaceships(let page):
            var result = [URLQueryItem]()
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            return result
            
        case .species(let page):
            var result = [URLQueryItem]()
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            return result
            
        case .vehicles(let page):
            var result = [URLQueryItem]()
            
            if let page = page {
                let pageNumber = URLQueryItem(name: "page", value: page)
                result.append(pageNumber)
            }
            return result
        }
    }
    
}
