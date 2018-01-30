//
//  StubData.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit





struct StubData {
    
    var movie: [Movie] {
        let movie1 = Movie(id: 01, title: "title 1", release_date: "09-09-2001", genres: ["action": 28, "comedy": 35], poster_path: #imageLiteral(resourceName: "movie-poster"), vote_average: 4, vote_count: 209)
        let movie2 = Movie(id: 01, title: "title 2", release_date: "09-09-2002", genres: ["action": 28, "comedy": 35], poster_path: #imageLiteral(resourceName: "movie-poster-1"), vote_average: 4, vote_count: 209)
        let movie3 = Movie(id: 01, title: "title 3", release_date: "09-09-2003", genres: ["action": 28, "comedy": 35], poster_path: #imageLiteral(resourceName: "movie-poster-2"), vote_average: 4, vote_count: 209)
        let movie4 = Movie(id: 01, title: "title 4", release_date: "09-09-2004", genres: ["action": 28, "comedy": 35], poster_path: #imageLiteral(resourceName: "movie-poster-3"), vote_average: 4, vote_count: 209)
        let movie5 = Movie(id: 01, title: "title 5", release_date: "09-09-2005", genres: ["action": 28, "comedy": 35], poster_path: #imageLiteral(resourceName: "movie-poster-4"), vote_average: 4, vote_count: 209)
        let movie6 = Movie(id: 01, title: "title 6", release_date: "09-09-2006", genres: ["action": 28, "comedy": 35], poster_path: #imageLiteral(resourceName: "movie-poster-5"), vote_average: 4, vote_count: 209)
        return [movie1, movie2, movie3, movie4, movie5, movie6]
    }
    
    var person: [Person] {
        let person1 = Person(id: 01, name: "name1", genre_ids: [01, 02], genres: ["Drama", "Action", "Comedy"], profile_path: #imageLiteral(resourceName: "person-1"), movies: ["movie": "movie"])
        let person2 = Person(id: 02, name: "name2", genre_ids: [01, 02], genres: ["Drama", "Action", "Comedy"], profile_path: #imageLiteral(resourceName: "person-2"), movies: ["movie": "movie"])
        let person3 = Person(id: 03, name: "name3", genre_ids: [01, 02], genres: ["Drama", "Action", "Comedy"], profile_path: #imageLiteral(resourceName: "person-3"), movies: ["movie": "movie"])
        let person4 = Person(id: 04, name: "name4", genre_ids: [01, 02], genres: ["Drama", "Action", "Comedy"], profile_path: #imageLiteral(resourceName: "person-4"), movies: ["movie": "movie"])
        let person5 = Person(id: 05, name: "name5", genre_ids: [01, 02], genres: ["Drama", "Action", "Comedy"], profile_path: #imageLiteral(resourceName: "person-5"), movies: ["movie": "movie"])
        let person6 = Person(id: 06, name: "name6", genre_ids: [01, 02], genres: ["Drama", "Action", "Comedy"], profile_path: #imageLiteral(resourceName: "person-6"), movies: ["movie": "movie"])
        
        return [person1, person2, person3, person4, person5, person6]
    }
    
}





















