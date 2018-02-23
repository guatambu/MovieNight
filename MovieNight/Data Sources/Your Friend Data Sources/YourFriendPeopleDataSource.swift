//
//  YourFriendPeopleDataSource.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/21/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YourFriendPeopleDataSource: NSObject, UITableViewDataSource {
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourFriendActorsTableViewCell", for: indexPath) as! YourFriendActorsTableViewCell
        
        let actor = data[indexPath.row]
        let viewModel = YourFriendPeopleViewModel(person: actor)
        cell.configure(with: viewModel)
        
        return cell
    }
}
