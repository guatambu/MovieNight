//
//  YouGenreDataSource.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/16/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YouGenreDataSource: NSObject, UITableViewDataSource {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "YouGenreTableViewCell", for: indexPath) as! YouGenreTableViewCell
        
        let genre = data[indexPath.row]
        cell.genreTitleLabel.text = genre.name
        
        return cell
    }
    

}
