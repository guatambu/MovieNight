//
//  Person.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class Person: MovieDBEntity {
    // ID
    var id: Int
    // Name
    var name: String
    // Genre IDs
    var genreIDs: [Int]
    // Genres
    var genres: [String]
    // Profile Pic Path
    var profilePath: String
    // Movies List
    var movies: [String: String]
    
    init(id: Int,
         name: String,
         genreIDs: [Int],
         genres: [String],
         profilePath: String,
         movies: [String: String]
        ) {
            self.id = id
            self.name = name
            self.genreIDs = genreIDs
            self.genres = genres
            self.profilePath = profilePath
            self.movies = movies
    }
    
    
    /*
    init?(json: [String: Any]) {
        struct Key {
            static let id = "ID"
            static let name = "name"
            static let genreIDs = "genre_ids"
            static let genres = "genres"
            static let profilePath = "profile_path"
            static let movies = "movies"
        }
        guard let idValue = json[Key.id] as? Int,
            let nameValue = json[Key.name] as? String,
            let genreIDsValue = json[Key.genreIDs] as? [Int],
            let genresValue = json[Key.genres] as? [String],
            let profilePathValue = json[Key.profilePath] as? String,
            let moviesValue = json[Key.movies] as? [String: String]
            else { return nil }
        
        self.id = idValue
        self.name = nameValue
        self.genreIDs = genreIDsValue
        self.genres = genresValue
        self.profilePath = profilePathValue
        self.movies = moviesValue
    }
    */
}
