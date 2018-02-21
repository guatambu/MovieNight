//
//  YouPeopleDataSource.swift
//  MovieNight
//
//  Created by Kelly Johnson on 2/20/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YouPeopleDataSource: NSObject, UITableViewDataSource {
    
    var data = [Person]()
    
    override init() {
        super.init()
    }
    
    func update(with people: [Person]) {
        data = people
    }
    
    //MARK: Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YouActorsTableViewCell", for: indexPath) as! YouActorsTableViewCell
        
        let actor = data[indexPath.row]
        let viewModel = YouPeopleViewModel(person: actor)
        cell.configure(with: viewModel)
        
        return cell
    }
    
    
}

