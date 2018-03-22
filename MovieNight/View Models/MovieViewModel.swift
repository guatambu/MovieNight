//
//  MovieViewModel.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/22/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
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
    
}

extension MovieViewModel {
    
    init(movie: Movie) {
        self.posterPath = movie.posterPath
        self.genreIDs = movie.genreIDs
        self.voteCount = movie.voteCount
        self.briefDescription = movie.briefDescription
        self.voteAverage = movie.voteAverage
        self.popularity = movie.popularity
        self.id = movie.id
        self.releaseDate = movie.releaseDate
        self.title = movie.title
    }
}




