//
//  Genre.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

enum Genre: Int {
    case action = 28
    // "id": 28, "name": "Action"
    case adventure = 12
    // "id": 12, "name": "Adventure"
    case animation = 16
    // "id": 16, "name": "Animation"
    case comedy = 35
    // "id": 35, "name": "Comedy"
    case crime = 80
    // "id": 80, "name": "Crime"
    case documentary = 99
    // "id": 99, "name": "Documentary"
    case drama = 18
    // "id": 18, "name": "Drama"
    case family = 10751
    // "id": 10751, "name": "Family"
    case fantasy = 14
    // "id": 14, "name": "Fantasy"
    case history = 36
    // "id": 36, "name": "History"
    case horror = 27
    // "id": 27, "name": "Horror"
    case music = 10402
    // "id": 10402, "name": "Music"
    case mystery = 9648
    // "id": 9648, "name": "Mystery"
    case romance = 10749
    // "id": 10749, "name": "Romance"
    case sciFi = 878
    // "id": 878, "name": "Science Fiction"
    case tvMovie = 10770
    // "id": 10770, "name": "TV Movie"
    case thriller = 53
    // "id": 53, "name": "Thriller"
    case war = 10752
    // "id": 10752, "name": "War"
    case western = 37
    // "id": 37, "name": "Western"
    
    var name: String {
        switch self {
        case .action: return "Action"
        case .adventure: return "Adventure"
        case .animation: return "Animation"
        case .comedy: return "Comedy"
        case .crime: return "Crime"
        case .documentary: return "Documentary"
        case .drama: return "Drama"
        case .family: return "Family"
        case .fantasy: return "Fantasy"
        case .history: return "History"
        case .horror: return "Horror"
        case .music: return "Music"
        case .mystery: return "Mystery"
        case .romance: return "Romance"
        case .sciFi: return "Science Fiction"
        case .thriller: return "Thriller"
        case .tvMovie: return "TV Movie"
        case .war: return "War"
        case .western: return "Western"
        }
    }
}













