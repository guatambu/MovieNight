//
//  StubDataTableViewDataSource.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/16/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class StubTableViewDataSource: NSObject, UITableViewDataSource {
    
    
    
    var data = [StubData]()
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "YouGenreTableViewCell")
        let text = data[indexPath.row]
        
        cell?.textLabel?.text = text.genre
        
    }
}
