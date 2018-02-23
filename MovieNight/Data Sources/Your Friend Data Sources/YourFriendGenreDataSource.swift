//
//  YourFriendGenreDataSource.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/21/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YourFriendGenreDataSource: NSObject, UITableViewDataSource {
        
    var data = [Genre]()
    
    override init() {
        super.init()
    }
    
    func update(with genres: [Genre]) {
        data = genres
    }
    
    //MARK: Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourFriendGenreTableViewCell", for: indexPath) as! YourFriendGenreTableViewCell
        
        let genre = data[indexPath.row]
        cell.yourFriendGenreCellLabel.text = genre.name
        
        return cell
    }
}
