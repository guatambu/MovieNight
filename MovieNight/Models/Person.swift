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

    // ID
    var id: Int
    // Name
    var name: String
    // Profile Pic Path
    var profilePath: String
    //var profilePicStub: UIImage
    // HashValue
    var hashValue: Int {
        return self.id
    }
    
    init(id: Int,
         name: String,
         profilePath: String,
         profilePicStub: UIImage
         
        ) {
            self.id = id
            self.name = name
            self.profilePath = profilePath
            //self.profilePicStub = profilePicStub
    }
    static func ==(lhs: Person, rhs: Person) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    
    init?(json: [String: Any]) {
        struct Key {
            static let id = "ID"
            static let name = "name"
            static let profilePath = "profile_path"
        }
        guard let idValue = json[Key.id] as? Int,
            let nameValue = json[Key.name] as? String,
            let profilePathValue = json[Key.profilePath] as? String
            else { return nil }
        
        self.id = idValue
        self.name = nameValue
        self.profilePath = profilePathValue
        }
    
}
