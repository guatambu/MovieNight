//
//  Person.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class Person: MovieDBEntity, Hashable {

    
    // Name
    var name: String
    //Popularity
    var popularity: Double
    // Profile Pic Path
    var profilePath: String
    //var profilePicStub: UIImage
    // ID
    var id: Int
    // HashValue
    var hashValue: Int {
        return self.id
    }
    
    init(
         name: String,
         popularity: Double,
         profilePath: String,
         //profilePicStub: UIImage,
         id: Int
         
        ) {
            self.name = name
            self.popularity = popularity
            self.profilePath = profilePath
            //self.profilePicStub = profilePicStub
            self.id = id
    }
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    init?(json: [String: Any]) {
        struct Key {
            static let name = "name"
            static let popularity = "popularity"
            static let profilePath = "profile_path"
            static let id = "id"
        }
        guard let nameValue = json[Key.name] as? String,
            let popularity = json[Key.popularity] as? Double,
            let profilePathValue = json[Key.profilePath] as? String,
            let idValue = json[Key.id] as? Int
        
            else { return nil }
        
        self.name = nameValue
        self.popularity = popularity
        self.profilePath = profilePathValue
        self.id = idValue
        }
    
}
