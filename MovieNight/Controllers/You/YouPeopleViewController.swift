//
//  YouPeopleViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/1/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class YouPeopleViewController: UIViewController, UITableViewDelegate {

    //MARK: Properties
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    let dataSource = YouPeopleDataSource()
    var myPeopleArray = [String]()
    var youPeopleSelectionsInstance: Selections!
    
    @IBOutlet weak var doneNavButton: UIBarButtonItem!
    @IBOutlet weak var selectedGenreBubbleImageView: UIImageView!
    @IBOutlet weak var selectedGenresLabel: UILabel!
    @IBOutlet weak var selectedPeopleBubbleImageView: UIImageView!
    @IBOutlet weak var selectedPeopleLabel: UILabel!
    @IBOutlet weak var youPeopleTableView: UITableView!
    
    //MARK: Actions
    
    @IBAction func doneButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToHomeScreen", sender: self)
        
    }
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 156/255, green: 192/255, blue: 222/255, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 156/255, green: 192/255, blue: 222/255, alpha: 1.0)
        selectedPeopleLabel.text = ""
        selectedPeopleBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        
        selectedGenresLabel.text = "\(youPeopleSelectionsInstance.yourGenres[0]), \(youPeopleSelectionsInstance.yourGenres[1]), \(youPeopleSelectionsInstance.yourGenres[2])"
        
        //Load Sample Data
        youPeopleTableView.dataSource = dataSource
        updateTableViewDataSource(for: youPeopleTableView)
        
        youPeopleTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSource.data[indexPath.row]
        youPeopleSelectionsInstance.yourPeople.append(person.name)
        let cell = self.youPeopleTableView.cellForRow(at: indexPath) as! YouActorsTableViewCell
        cell.bubbleSelectedTableCellContentView.image = #imageLiteral(resourceName: "bubble-selected")
        
        if youPeopleSelectionsInstance.yourPeople.count == 1 {
            selectedPeopleLabel.text = "\(youPeopleSelectionsInstance.yourPeople[0])"
        } else if youPeopleSelectionsInstance.yourPeople.count == 2 {
            selectedPeopleLabel.text = "\(youPeopleSelectionsInstance.yourPeople[0]), \(youPeopleSelectionsInstance.yourPeople[1])"
        } else if youPeopleSelectionsInstance.yourPeople.count >= 3 {
            selectedPeopleLabel.text = "\(youPeopleSelectionsInstance.yourPeople[0]), \(youPeopleSelectionsInstance.yourPeople[1]), \(youPeopleSelectionsInstance.yourPeople[2])"
            selectedPeopleBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            self.youPeopleTableView.allowsSelection = false
            cell.setSelected(false, animated: true)
            self.doneNavButton.isEnabled = true
        } else {
            self.youPeopleTableView.allowsSelection = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension YouPeopleViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.person)
        /*for thing in dataSource.data {
            print("you: \(thing.name)")
        }*/
        tableView.reloadData()
    }
}
