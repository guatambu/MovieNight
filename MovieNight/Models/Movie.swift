//
//  Movie.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class Movie: MovieDBEntity {
    // ID
    var id: Int
    // Title
    var title: String
    // Release Date
    var releaseDate: String
    // Genres
    var genreIDs: [Int]
    // Movie Poster Path
    var posterPath: String
    // Movie Rating
    var voteAverage: Int
    // Movie Popularity
    var voteCount: Int
    // Brief Description
    var briefDescription: String
    
    init(id: Int,
         title: String,
         releaseDate: String,
         genreIDs: [Int],
         posterPath: String,
         voteAverage: Int,
         voteCount: Int,
         briefDescription: String) {
            self.id = id
            self.title = title
            self.releaseDate = releaseDate
            self.genreIDs = genreIDs
            self.posterPath = posterPath
            self.voteAverage = voteAverage
            self.voteCount = voteCount
            self.briefDescription = briefDescription
    }
    
    
    /*
     init?(json: [String: Any]) {
         struct Key {
             static let id = "ID"
             static let title = "title"
             static let releaseDate = "release_date"
             static let genreIDs = "genre_ids"
             static let posterPath = "poster_path"
             static let voteAverage = "vote_average"
             static let voteCount = "vote_count"
             static let briefDescription = "overview"
         }
         guard let idValue = json[Key.id] as? Int,
             let titleValue = json[Key.title] as? String,
             let releaseDateValue = json[Key.releaseDate] as? String,
             let genreIDsValue = json[Key.genreIDs] as? [Int],
             let posterPathValue = json[Key.posterPath] as? String,
             let voteAverageValue = json[Key.voteAverage] as? Int,
             let voteCountValue = json[Key.voteCount] as? Int,
             let briefDescriptionValue = json[Key.briefDescription] as? String
             else { return nil }
     
         self.id = idValue
         self.title = titleValue
         self.releaseDate = releaseDateValue
         self.genreIDs = genreIDsValue
         self.posterPath = posterPathValue
         self.voteAverage = voteAverageValue
         self.voteCount = voteCountValue
         self.briefDescription = briefDescriptionValue
     }
     */
}



