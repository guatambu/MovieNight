//
//  YourFriendPeopleViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/2/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class YourFriendPeopleViewController: UIViewController, UITableViewDelegate {

    //MARK: Properties
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    let dataSource = YourFriendPeopleDataSource()
    var myPeopleArray = [String]()
    var yourFriendPeopleSelectionsInstance: Selections!
    
    @IBOutlet weak var doneNavButton: UIBarButtonItem!
    @IBOutlet weak var selectedGenresBubbleImageView: UIImageView!
    @IBOutlet weak var selectedGenresLabel: UILabel!
    @IBOutlet weak var selectedPeopleBubbleImageView: UIImageView!
    @IBOutlet weak var selectedPeopleLabel: UILabel!
    @IBOutlet weak var yourFriendPeopleTableView: UITableView!
    
    //MARK: Actions
    
    @IBAction func doneButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToHomeScreenVC", sender: self)
        
    }
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 156/255, green: 222/255, blue: 186/255, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 156/255, green: 222/255, blue: 186/255, alpha: 1.0)
        selectedPeopleLabel.text = ""
        selectedPeopleBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        
        selectedGenresLabel.text = "\(yourFriendPeopleSelectionsInstance.yourFriendGenres[0]), \(yourFriendPeopleSelectionsInstance.yourFriendGenres[1]), \(yourFriendPeopleSelectionsInstance.yourFriendGenres[2])"
        selectedGenresBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
        
        //Load Sample Data
        yourFriendPeopleTableView.dataSource = dataSource
        updateTableViewDataSource(for: yourFriendPeopleTableView)
        
        yourFriendPeopleTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSource.data[indexPath.row]
        yourFriendPeopleSelectionsInstance.yourFriendPeople.append(person)
        let cell = self.yourFriendPeopleTableView.cellForRow(at: indexPath) as! YourFriendActorsTableViewCell
        cell.yourFriendPersonSelectedBubbleIMageView.image = #imageLiteral(resourceName: "bubble-selected")
        
        if yourFriendPeopleSelectionsInstance.yourFriendPeople.count == 1 {
            selectedPeopleLabel.text = "\(yourFriendPeopleSelectionsInstance.yourFriendPeople[0].name)"
        } else if yourFriendPeopleSelectionsInstance.yourFriendPeople.count == 2 {
            selectedPeopleLabel.text = "\(yourFriendPeopleSelectionsInstance.yourFriendPeople[0].name), \(yourFriendPeopleSelectionsInstance.yourFriendPeople[1].name)"
        } else if yourFriendPeopleSelectionsInstance.yourFriendPeople.count >= 3 {
            selectedPeopleLabel.text = "\(yourFriendPeopleSelectionsInstance.yourFriendPeople[0].name), \(yourFriendPeopleSelectionsInstance.yourFriendPeople[1].name), \(yourFriendPeopleSelectionsInstance.yourFriendPeople[2].name)"
            selectedPeopleBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            self.yourFriendPeopleTableView.allowsSelection = false
            cell.setSelected(false, animated: true)
            self.doneNavButton.isEnabled = true
        } else {
            self.yourFriendPeopleTableView.allowsSelection = true
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

extension YourFriendPeopleViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.person1)
        /*for thing in dataSource.data {
            print("your friend: \(thing.name)")
        }*/
        tableView.reloadData()
    }
}
