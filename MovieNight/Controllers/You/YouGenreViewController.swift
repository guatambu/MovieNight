//
//  YouGenreViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 2/1/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import Foundation
import UIKit

class YouGenreViewController: UIViewController, UITableViewDelegate {
    
    //MARK: Properties
    
    /*
    fileprivate enum EndpointOptions: String {
        case apiKey = "9d2b65148c48ec092a601516a168a71b"
        case languageEnglishUS = "en-US"
        case page1 = "1"
    }
    */
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    let client = MovieDatabaseAPIClient()
    let dataSource = YouGenreDataSource()
    let navigationBarAppearance = UINavigationBar.appearance()
    let youGenreTableViewCell = YouGenreTableViewCell()
    
    var myArray = [String]()
    var youGenreSelectionsInstance: Selections!
    
    @IBOutlet weak var nextNavButton: UIBarButtonItem!
    @IBOutlet weak var selecteGenresLabel: UILabel!

    @IBOutlet weak var selectionBubbleImageView: UIImageView!
    @IBOutlet weak var youGenreTableView: UITableView!
    
    //MARK: Actions
    
    
    
    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 156/255, green: 192/255, blue: 222/255, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor(red: 156/255, green: 192/255, blue: 222/255, alpha: 1.0)
        selecteGenresLabel.text = ""
        selectionBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        
        // Load sample data
        youGenreTableView.dataSource = dataSource
        updateTableViewDataSource(for: youGenreTableView)
        
        
        youGenreTableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genre = dataSource.data[indexPath.row]
        youGenreSelectionsInstance.yourGenres.append(genre)
        let cell = self.youGenreTableView.cellForRow(at: indexPath) as! YouGenreTableViewCell
        cell.bubbleEmptyImageView.image = #imageLiteral(resourceName: "bubble-selected")
        
        if youGenreSelectionsInstance.yourGenres.count == 1 {
            selecteGenresLabel.text = "\(youGenreSelectionsInstance.yourGenres[0].name)"
        } else if youGenreSelectionsInstance.yourGenres.count == 2 {
            selecteGenresLabel.text = "\(youGenreSelectionsInstance.yourGenres[0].name), \(youGenreSelectionsInstance.yourGenres[1].name)"
        } else if youGenreSelectionsInstance.yourGenres.count >= 3 {
            selecteGenresLabel.text = "\(youGenreSelectionsInstance.yourGenres[0].name), \(youGenreSelectionsInstance.yourGenres[1].name), \(youGenreSelectionsInstance.yourGenres[2].name)"
            selectionBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            self.youGenreTableView.allowsSelection = false
            cell.setSelected(false, animated: true)
            self.nextNavButton.isEnabled = true
        } else {
            self.youGenreTableView.allowsSelection = true
        }
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let youPeopleFinalViewController = segue.destination as? YouPeopleViewController else { return }
        youPeopleFinalViewController.youPeopleSelectionsInstance = youGenreSelectionsInstance
        
        client.getPopularPeople(with: client.popularPeopleEndpoint) { myPeopleArray, error in
            //myPeopleArray = client.allDownloadedPeople
            youPeopleFinalViewController.myPeopleArray = self.client.allDownloadedPeople
            youPeopleFinalViewController.dataSource.data = youPeopleFinalViewController.myPeopleArray
            youPeopleFinalViewController.youPeopleTableView.reloadData()
            print("print displayed myPeopleArray: \(youPeopleFinalViewController.myPeopleArray)")
        }
        
        
        //let endpoint = TMDBAPI.person(apiKey: EndpointOptions.apiKey.rawValue, language: EndpointOptions.languageEnglishUS.rawValue, page: EndpointOptions.page1.rawValue)
        
        //print("******\n\(endpoint.request)\n*****")
        
        //here i will have to generate the endpoint.request URL which suggests i have to include the api_key in this file
            
    
        
    }
    

}

extension YouGenreViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.genre)
        /*for thing in dataSource.data {
            print(thing.name)
        }*/
        tableView.reloadData()
    }
    
}
