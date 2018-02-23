//
//  YourFriendGenreViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/2/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YourFriendGenreViewController: UIViewController {

    //MARK: Properties
    
    let dataSource = YourFriendGenreDataSource()

    @IBOutlet weak var selectedGenreImageView: UIImageView!
    @IBOutlet weak var selectedGenresLabel: UILabel!
    @IBOutlet weak var yourFriendGenreTableView: UITableView!
    
    //MARK: Actions
    
    @IBAction func nextButtonAction(_ sender: Any) {
    }
    
    
   
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load sample data
        yourFriendGenreTableView.dataSource = dataSource
        updateTableViewDataSource(for: yourFriendGenreTableView)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension YourFriendGenreViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.genre)
        for thing in dataSource.data {
            print(thing.name)
        }
        tableView.reloadData()
    }
    
}
