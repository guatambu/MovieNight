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
        let movie1 = Movie(id: 01, title: "title 1", releaseDate: "09-09-2001", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie2 = Movie(id: 01, title: "title 2", releaseDate: "09-09-2002", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie3 = Movie(id: 01, title: "title 3", releaseDate: "09-09-2003", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie4 = Movie(id: 01, title: "title 4", releaseDate: "09-09-2004", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie5 = Movie(id: 01, title: "title 5", releaseDate: "09-09-2005", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie6 = Movie(id: 01, title: "title 6", releaseDate: "09-09-2006", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        return [movie1, movie2, movie3, movie4, movie5, movie6]
    }
    
    var person: [Person] {
        let person1 = Person(id: 01, name: "name1", genreIDs: [01, 02], genres: ["Drama", "Action", "Comedy"], profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg", movies: ["movie": "movie"])
        let person2 = Person(id: 02, name: "name2", genreIDs: [01, 02], genres: ["Drama", "Action", "Comedy"], profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg", movies: ["movie": "movie"])
        let person3 = Person(id: 03, name: "name3", genreIDs: [01, 02], genres: ["Drama", "Action", "Comedy"], profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg", movies: ["movie": "movie"])
        let person4 = Person(id: 04, name: "name4", genreIDs: [01, 02], genres: ["Drama", "Action", "Comedy"], profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg", movies: ["movie": "movie"])
        let person5 = Person(id: 05, name: "name5", genreIDs: [01, 02], genres: ["Drama", "Action", "Comedy"], profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg", movies: ["movie": "movie"])
        let person6 = Person(id: 06, name: "name6", genreIDs: [01, 02], genres: ["Drama", "Action", "Comedy"], profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg", movies: ["movie": "movie"])
        
        return [person1, person2, person3, person4, person5, person6]
    }
    
}





















