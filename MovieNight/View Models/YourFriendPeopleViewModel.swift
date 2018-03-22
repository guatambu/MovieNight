//
//  YourFriendPeopleViewModel.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/21/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation


struct YourFriendPeopleViewModel {
    let id: Int
    let fullName: String
    var profilePath: String
    
}

extension YourFriendPeopleViewModel {
    
    init(person: Person) {
        self.id = person.id
        self.fullName = person.name
        self.profilePath = person.profilePath
    }
}
