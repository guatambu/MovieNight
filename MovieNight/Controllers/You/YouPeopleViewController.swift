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
        
        
        //Load Sample Data
        youPeopleTableView.dataSource = dataSource
        updateTableViewDataSource(for: youPeopleTableView)
        
        youPeopleTableView.delegate = self

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSource.data[indexPath.row]
        myPeopleArray.append(person.name)
        let cell = self.youPeopleTableView.cellForRow(at: indexPath) as! YouActorsTableViewCell
        cell.bubbleSelectedTableCellContentView.image = #imageLiteral(resourceName: "bubble-selected")
        
        if myPeopleArray.count == 1 {
            selectedPeopleLabel.text = "\(myPeopleArray[0])"
        } else if myPeopleArray.count == 2 {
            selectedPeopleLabel.text = "\(myPeopleArray[0]), \(myPeopleArray[1])"
        } else if myPeopleArray.count >= 3 {
            selectedPeopleLabel.text = "\(myPeopleArray[0]), \(myPeopleArray[1]), \(myPeopleArray[2])"
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
            print("you: \(thing.name)")
        }
        tableView.reloadData()
    }
}
