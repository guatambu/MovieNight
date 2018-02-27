//
//  YouGenreViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/1/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YouGenreViewController: UIViewController {
    
    //MARK: Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    let dataSource = YouGenreDataSource()
    let navigationBarAppearance = UINavigationBar.appearance()
    
    @IBOutlet weak var selecteGenresLabel: UILabel!
    @IBOutlet weak var selectedBubbleImageView: UIView!
    @IBOutlet weak var youGenreTableView: UITableView!
    
    //MARK: Actions
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 156/255, green: 192/255, blue: 222/255, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 156/255, green: 192/255, blue: 222/255, alpha: 1.0)
        
        // Load sample data
        youGenreTableView.dataSource = dataSource
        updateTableViewDataSource(for: youGenreTableView)
        
        
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

extension YouGenreViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.genre)
        for thing in dataSource.data {
            print(thing.name)
        }
        tableView.reloadData()
    }
    
}
