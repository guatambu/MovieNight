//
//  Selections.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 3/1/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

class Selections {
    var yourGenres = [Genre]()
    var yourPeople = [Person]()
    var yourFriendGenres = [Genre]()
    var yourFriendPeople = [Person]()
    var aggregateGenreSelections = [Genre]()
    var aggregatePeopleSelections = [Person]()
    var genreMatches = [Genre]()
    var peopleMatches = [Person]()
    var genreMatchStrings = [String]()
    var genreMatchValues: String = ""
    var peopleMatchStrings = [String]()
    var peopleMatchValues: String = ""
    
    
    //in the YourResultsViewController in the prepare(for:segue) comment line i have the movie results object being passed to the movie results VC
    //the users selections comparison will:
    //look in the two genre arrays for any overlap
    //look in the two people arrays for any overlap
    //then it will spit out an array removing any overlapping duplicates and generate a MovieAPI URL for the network call for those overlapping strings
    //if there is no overlap between the users two selections, then it will spit out an array of all the strings present
        //case 1: using the overlapping strings as query parameters to query the MovieDB API using *** and/or *** query parameters to get all results including the overlapping user selections
            //this results in an "OR" query where any multiples of query items, be they genres or people will be, and they will be using the "|" to separate the items in the list of query items
        //case 2: an alert window will come up giving the users a warning that their selections produed no common results and they will be given the choice to proceed with a search that includes all their various input which could be quite a lot of results or to start over and try again for some overlap
            //this results in an "OR" query where any multiples of query items, be they genres or people will be, and they will be using the "|" to separate the items in the list of query items which is liekly to be a very long list of returned items
        //from here, the network call will be made with a MovieDB API "discover" query
    //the YourResultsTableViewController will then display the results of the above network call
        
    func matchFinder() {
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
        
        print("Users Genre selections: \(selections.aggregateGenreSelections)\nUsers People selections: \(selections.aggregatePeopleSelections)")
        
        var genreMatchesDict: [Genre: Int] = [:]
        var peopleMatchesDict: [Person: Int] = [:]
        
        selections.aggregateGenreSelections.forEach { genreMatchesDict[$0, default: 0] += 1 }
        selections.aggregatePeopleSelections.forEach { peopleMatchesDict[$0, default: 0] += 1 }
        
        for (key, value) in genreMatchesDict {
            if value >= 2 {
                selections.genreMatches.append(key)
            }
        }
        for (key, value) in peopleMatchesDict {
            if value >= 2 {
                selections.peopleMatches.append(key)
            }
        }
        print("These are the genre matches: \(selections.genreMatches).\nThese are the people matches: \(selections.peopleMatches).")
        for genre in selections.genreMatches {
            print("These are the matched genre IDs: \(genre.rawValue)")
            selections.genreMatchStrings.append("\(genre.rawValue)")
        }
        let myGenreMatches = selections.genreMatchStrings.joined(separator: "|")
        genreMatchValues = myGenreMatches
        print(genreMatchValues)
        for person in selections.peopleMatches {
            print("These are the matched people IDs: \(person.id)")
            selections.peopleMatchStrings.append("\(person.id)")
        }
        let myPeopleMatches = selections.peopleMatchStrings.joined(separator: ",")
        peopleMatchValues = myPeopleMatches
        print(peopleMatchValues)
    }
}


