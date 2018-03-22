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
    // Movie Poster Path
    var posterPath: String
    // Genres
    var genreIDs: [Int]
    // Movie Popularity
    var voteCount: Int
    // Brief Description
    var briefDescription: String
    // Movie Rating
    var voteAverage: Int
    // Popularity
    var popularity: Int
    // ID
    var id: Int
    // Release Date
    var releaseDate: String
    // Title
    var title: String
    
    
    init(posterPath: String,
         genreIDs: [Int],
         voteCount: Int,
         briefDescription: String,
         voteAverage: Int,
         popularity: Int,
         id: Int,
         releaseDate: String,
         title: String
         ) {
            self.posterPath = posterPath
            self.genreIDs = genreIDs
            self.voteCount = voteCount
            self.briefDescription = briefDescription
            self.voteAverage = voteAverage
            self.popularity = popularity
            self.id = id
            self.releaseDate = releaseDate
            self.title = title
    }
    
    
    
     init?(json: [String: Any]) {
         struct Key {
             static let posterPath = "poster_path"
             static let genreIDs = "genre_ids"
             static let voteCount = "vote_count"
             static let briefDescription = "overview"
             static let voteAverage = "vote_average"
             static let popularity = "popularity"
             static let id = "ID"
             static let releaseDate = "release_date"
             static let title = "title"
         }
         guard let posterPathValue = json[Key.posterPath] as? String,
             let genreIDsValue = json[Key.genreIDs] as? [Int],
             let voteCountValue = json[Key.voteCount] as? Int,
             let briefDescriptionValue = json[Key.briefDescription] as? String,
             let voteAverageValue = json[Key.voteAverage] as? Int,
             let popularity = json[Key.popularity] as? Int,
             let idValue = json[Key.id] as? Int,
             let releaseDateValue = json[Key.releaseDate] as? String,
             let titleValue = json[Key.title] as? String
             else { return nil }

         self.posterPath = posterPathValue
         self.genreIDs = genreIDsValue
         self.voteCount = voteCountValue
         self.briefDescription = briefDescriptionValue
         self.voteAverage = voteAverageValue
         self.popularity = popularity
         self.id = idValue
         self.releaseDate = releaseDateValue
         self.title = titleValue
     }
}



