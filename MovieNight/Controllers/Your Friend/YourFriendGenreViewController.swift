//
//  YourFriendGenreViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/2/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class YourFriendGenreViewController: UIViewController, UITableViewDelegate {

    //MARK: Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    let dataSource = YourFriendGenreDataSource()
    var myArray = [String]()
    
    @IBOutlet weak var nextNavButton: UIBarButtonItem!
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
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 156/255, green: 222/255, blue: 186/255, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 156/255, green: 222/255, blue: 186/255, alpha: 1.0)
        selectedGenresLabel.text = ""
        selectedGenreImageView.image = #imageLiteral(resourceName: "bubble-empty")

        
        // Load sample data
        yourFriendGenreTableView.dataSource = dataSource
        updateTableViewDataSource(for: yourFriendGenreTableView)
        
        yourFriendGenreTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = dataSource.data[indexPath.row]
        myArray.append(genre.name)
        let cell = self.yourFriendGenreTableView.cellForRow(at: indexPath) as! YourFriendGenreTableViewCell
        cell.yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
        
        if myArray.count == 1 {
            selectedGenresLabel.text = "\(myArray[0])"
        } else if myArray.count == 2 {
            selectedGenresLabel.text = "\(myArray[0]), \(myArray[1])"
        } else if myArray.count >= 3 {
            selectedGenresLabel.text = "\(myArray[0]), \(myArray[1]), \(myArray[2])"
            selectedGenreImageView.image = #imageLiteral(resourceName: "bubble-selected")
            self.yourFriendGenreTableView.allowsSelection = false
            cell.setSelected(false, animated: true)
            self.nextNavButton.isEnabled = true
        } else {
            self.yourFriendGenreTableView.allowsSelection = true
        }
        
        
        
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
