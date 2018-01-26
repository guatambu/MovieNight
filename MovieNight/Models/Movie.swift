//
//  Movie.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/23/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation

class Movie: MovieDBEntity {
    // ID
    var id: Int
    // Title
    var title: String
    // Release Date
    var release_date: String
    // Genres
    var genres: [String: Any]
    // Movie Poster Path
    var poster_path: String
    // Movie Rating
    var vote_average: Int
    // Movie Popularity
    var vote_count: Int
    
    init(id: Int,
         title: String,
         release_date: String,
         genres: [String: Any],
         poster_path: String,
         vote_average: Int,
         vote_count: Int) {
            self.id = id
            self.title = title
            self.release_date = release_date
            self.genres = genres
            self.poster_path = poster_path
            self.vote_average = vote_average
            self.vote_count = vote_count
    }
    
    
    /*
    init?(json: [String: Any]) {
        struct Key {
            static let length = "length"
            static let pilots = "pilots"
            static let crew = "crew"
            static let name = "name"
            static let films = "films"
            static let model = "model"
            static let cost_in_credits = "cost_in_credits"
            static let cargoCapacity = "cargo_capacity"
            static let maxAtmospheringSpeed = "max_atmosphering_speed"
            static let edited = "edited"
            static let created = "created"
            static let passengers = "passengers"
            static let starship_class = "starship_class"
            static let hyperdriveRating = "hyperdrive_rating"
            static let mglt = "MGLT"
            static let consumables = "consumables"
            static let make = "manufacturer"
            static let url = "url"
        }
        guard let lengthValue = json[Key.length] as? String,
            let pilotsValue = json[Key.pilots] as? [Any],
            let crewValue = json[Key.crew] as? String,
            let nameValue = json[Key.name] as? String,
            let filmsValue = json[Key.films] as? [Any],
            let modelValue = json[Key.model] as? String,
            let costInCreditsValue = json[Key.cost_in_credits] as? String,
            let cargoCapacityValue = json[Key.cargoCapacity] as? String,
            let maxAtmospheringSpeedValue = json[Key.maxAtmospheringSpeed] as? String,
            let editedValue = json[Key.edited] as? String,
            let createdValue = json[Key.created] as? String,
            let passengersValue = json[Key.passengers] as? String,
            let starshipClassValue = json[Key.starship_class] as? String,
            let hyperdriveRatingValue = json[Key.hyperdriveRating] as? String,
            let mgltValue = json[Key.mglt] as? String,
            let consumablesValue = json[Key.consumables] as? String,
            let makeValue = json[Key.make] as? String,
            let urlValue = json[Key.url] as? String
            else { return nil }
        
        self.length = lengthValue
        self.pilots = pilotsValue
        self.crew = crewValue
        self.name = nameValue
        self.films = filmsValue
        self.model = modelValue
        self.cost_in_credits = costInCreditsValue
        self.cargoCapacity = cargoCapacityValue
        self.maxAtmospheringSpeed = maxAtmospheringSpeedValue
        self.edited = editedValue
        self.created = createdValue
        self.passengers = passengersValue
        self.starship_class = starshipClassValue
        self.hyperdriveRating = hyperdriveRatingValue
        self.mglt = mgltValue
        self.consumables = consumablesValue
        self.make = makeValue
        self.url = urlValue
    }
    */
}
