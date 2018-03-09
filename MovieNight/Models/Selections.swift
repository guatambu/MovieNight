//
//  Selections.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 3/1/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

struct Selections {
    var yourGenres = [String]()
    var yourPeople = [String]()
    var yourFriendGenres = [String]()
    var yourFriendPeople = [String]()
    var aggregateGenreSelections = [String]()
    var aggregatePeopleSelections = [String]()
    var results = [String]()
    
    func resultsSynthesis() {
        for selection in selections.yourGenres {
            selections.aggregateGenreSelections.append(selection)
        }
        for selection in selections.yourFriendGenres {
            selections.aggregateGenreSelections.append(selection)
        }
        for selection in selections.yourPeople {
            selections.aggregatePeopleSelections.append(selection)
        }
        for selection in selections.yourFriendPeople {
            selections.aggregatePeopleSelections.append(selection)
        }
        
        print("\(selections.aggregateGenreSelections)\n\(selections.aggregatePeopleSelections)")
        
        let uniqueGenreResults = Array(Set(selections.aggregateGenreSelections))
        let uniquePeopleResults = Array(Set(selections.aggregatePeopleSelections))
        
        for result in uniqueGenreResults{
            selections.results.append(result)
        }
        for result in uniquePeopleResults {
            selections.results.append(result)
        }
        print("\(uniqueGenreResults)\n\(uniquePeopleResults)")
        
        print(selections.results)
    }
    
    
}


