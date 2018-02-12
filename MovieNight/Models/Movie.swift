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
    var genres: [String: Any]
    // Movie Poster Path
    var posterPath: String
    // Movie Rating
    var voteAverage: Int
    // Movie Popularity
    var voteCount: Int
    
    init(id: Int,
         title: String,
         releaseDate: String,
         genres: [String: Any],
         posterPath: String,
         voteAverage: Int,
         voteCount: Int) {
            self.id = id
            self.title = title
            self.releaseDate = releaseDate
            self.genres = genres
            self.posterPath = posterPath
            self.voteAverage = voteAverage
            self.voteCount = voteCount
    }
    
    
    /*
     init?(json: [String: Any]) {
         struct Key {
             static let id = "ID"
             static let title = "title"
             static let releaseDate = "release_date"
             static let genres = "genres"
             static let posterPath = "poster_path"
             static let voteAverage = "vote_average"
             static let voteCount = "vote_count"
         }
         guard let idValue = json[Key.id] as? Int,
             let titleValue = json[Key.title] as? String,
             let releaseDateValue = json[Key.releaseDate] as? String,
             let genresValue = json[Key.genres] as? [String: Any],
             let posterPathValue = json[Key.posterPath] as? String,
             let voteAverageValue = json[Key.voteAverage] as? Int,
             let voteCountValue = json[Key.voteCount] as? Int
             else { return nil }
     
         self.id = idValue
         self.title = titleValue
         self.releaseDate = releaseDateValue
         self.genres = genresValue
         self.posterPath = posterPathValue
         self.voteAverage = voteAverageValue
         self.voteCount = voteCountValue
     }
     */
}



