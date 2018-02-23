//
//  MovieResultsDataSource.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/22/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class MovieResultsDataSource: NSObject, UITableViewDataSource {
    
    var data = [Movie]()
    
    override init() {
        super.init()
    }
    
    func update(with movies: [Movie]) {
        data = movies
    }
    
    //MARK: Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourResultsTableViewCell", for: indexPath) as! YourResultsTableViewCell
        
        let movie = data[indexPath.row]
        let viewModel = MovieViewModel(movie: movie)
        cell.configure(with: viewModel)
        
        return cell
    }
}
