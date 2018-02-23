//
//  MovieViewModel.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/22/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

struct MovieViewModel {
    
    // ID
    let id: Int
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
    
}

extension MovieViewModel {
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        self.genreIDs = movie.genreIDs
        self.posterPath = movie.posterPath
        self.voteAverage = movie.voteAverage
        self.voteCount = movie.voteCount
        self.briefDescription = movie.briefDescription
    }
}




