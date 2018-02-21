//
//  YouPeopleViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/1/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YouPeopleViewController: UIViewController {

    //MARK: Properties
    
    let dataSource = YouPeopleDataSource()
    
    @IBOutlet weak var selectedGenreBubbleImageView: UIImageView!
    @IBOutlet weak var selectedGenresLabel: UILabel!
    @IBOutlet weak var selectedPeopleBubbleImageView: UIImageView!
    @IBOutlet weak var selectedPeopleLabel: UILabel!
    @IBOutlet weak var youPeopleTableView: UITableView!
    
    //MARK: Actions
    
    @IBAction func doneButtonAction(_ sender: Any) {
    }
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        youPeopleTableView.dataSource = dataSource
        updateTableViewDataSource(for: youPeopleTableView)

        // Do any additional setup after loading the view.
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

extension YouPeopleViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.person)
        for thing in dataSource.data {
            print(thing.name)
        }
        tableView.reloadData()
    }
}
