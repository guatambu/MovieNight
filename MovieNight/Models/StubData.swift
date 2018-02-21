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
    
    static var movie: [Movie] {
        let movie1 = Movie(id: 01, title: "title 1", releaseDate: "09-09-2001", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie2 = Movie(id: 01, title: "title 2", releaseDate: "09-09-2002", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie3 = Movie(id: 01, title: "title 3", releaseDate: "09-09-2003", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie4 = Movie(id: 01, title: "title 4", releaseDate: "09-09-2004", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie5 = Movie(id: 01, title: "title 5", releaseDate: "09-09-2005", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        let movie6 = Movie(id: 01, title: "title 6", releaseDate: "09-09-2006", genres: ["action": 28, "comedy": 35], posterPath: "/dU1XG1DI6lkZ567vmtM9ifQJ38F.jpg", voteAverage: 4, voteCount: 209)
        return [movie1, movie2, movie3, movie4, movie5, movie6]
    }
    
    static var person: [Person] {
        let person1 = Person(id: 01, name: "name1", /*profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg",*/ profilePicStub: #imageLiteral(resourceName: "person-4"))
        let person2 = Person(id: 02, name: "name2", /*profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg",*/ profilePicStub: #imageLiteral(resourceName: "person-4"))
        let person3 = Person(id: 03, name: "name3", /*profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg",*/ profilePicStub: #imageLiteral(resourceName: "person-4"))
        let person4 = Person(id: 04, name: "name4", /*profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg",*/ profilePicStub: #imageLiteral(resourceName: "person-4"))
        let person5 = Person(id: 05, name: "name5", /*profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg",*/ profilePicStub: #imageLiteral(resourceName: "person-4"))
        let person6 = Person(id: 06, name: "name6", /*profilePath: "/13YNM8lBKnK26MYd2Lp3OpU6JdI.jpg",*/ profilePicStub: #imageLiteral(resourceName: "person-4"))
        
        return [person1, person2, person3, person4, person5, person6]
    }
    
    static var genre: [Genre] {
        let genre1 = Genre.action
        let genre2 = Genre.adventure
        let genre3 = Genre.comedy
        let genre4 = Genre.drama
        let genre5 = Genre.horror
        let genre6 = Genre.sciFi
        
        return [genre1, genre2, genre3, genre4, genre5, genre6]
    }
    
}





















