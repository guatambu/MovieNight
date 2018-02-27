//
//  YourFriendPeopleViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/2/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YourFriendPeopleViewController: UIViewController {

    //MARK: Properties
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    let dataSource = YourFriendPeopleDataSource()
    
    @IBOutlet weak var selectedGenresBubbleImageView: UIImageView!
    @IBOutlet weak var selectedGenresLabel: UILabel!
    @IBOutlet weak var selectedPeopleBubbleImageView: UIImageView!
    @IBOutlet weak var selectedPeopleLabel: UILabel!
    @IBOutlet weak var yourFriendPeopleTableView: UITableView!
    
    //MARK: Actions
    
    @IBAction func doneButtonAction(_ sender: Any) {
    }
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 156/255, green: 222/255, blue: 186/255, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 156/255, green: 222/255, blue: 186/255, alpha: 1.0)
        
        //Load Sample Data
        yourFriendPeopleTableView.dataSource = dataSource
        updateTableViewDataSource(for: yourFriendPeopleTableView)
        
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

extension YourFriendPeopleViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.person1)
        
        tableView.reloadData()
    }
}
