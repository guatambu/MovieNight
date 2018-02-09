//
//  ImagesEndpoint.swift
//  MovieNight
//
//  Created by ichael Guatambu Davis on 2/8/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

/*
******
Images URL info

movie posters have an image path called: "poster_path"

*** movie Poster Pic URL For Specific Movie With ID ***

image base URL: https://image.tmdb.org/t/p/
image size path: w500
image poster_path: /kqjL17yufvn9OVLyXYpvtyrFfak.jpg

person profile pics have an image path called:  "profile_path"

*** Person Profile Pic URL for popular person list ***
    
image base URL: https://image.tmdb.org/t/p/
image size path: w500
image profile_path: /kqjL17yufvn9OVLyXYpvtyrFfak.jpg

******
*/


protocol ImageEndpoint {
    var base: String { get }
    var path: String { get }
}

extension ImageEndpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum TMDBImagesAPI {
    case smallPersonProfileImage(smallProfilePath: String)
    case originalPersonProfileImage(originalProfilePath: String)
    case smallMoviePosterImage(smallPosterPath: String)
    case originalMoviePosterImage(originalPosterPath: String)
}


extension TMDBImagesAPI: ImageEndpoint {

    var base: String {
        return "https://image.tmdb.org/t/p/"
    }

    var path: String {
        switch self{
        case .smallPersonProfileImage(let smallProfilePath): return "w185/\(smallProfilePath)"
        case .originalPersonProfileImage(let originalProfilePath): return "original/\(originalProfilePath)"
        case .smallMoviePosterImage(let smallPosterPath): return "w185/\(smallPosterPath)"
        case .originalMoviePosterImage(let originalPosterPath): return "original/\(originalPosterPath)"
        }
    }
}





