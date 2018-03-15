//
//  HomeScreenViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/22/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

var selections = Selections()

class HomeScreenViewController: UIViewController {

    //MARK: Properties
    
    fileprivate enum DiscoverOptions: String {
        case apiKey = "9d2b65148c48ec092a601516a168a71b"
        case languageEnglishUS = "en-US"
        case sortByDescendingPopularity = "popularity.desc"
        case sortByAscendingPopularity = "popularity.asc"
        case isTrue = "true"
        case isFalse = "false"
        case page1 = "1"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    @IBOutlet weak var youBubbleImageView: UIImageView!
    @IBOutlet weak var yourFriendBubbleImageView: UIImageView!
    @IBOutlet weak var youStackViewOutlet: UIStackView!
    @IBOutlet weak var yourFriendStackViewOutlet: UIStackView!
    
    @IBOutlet weak var viewResultsButtonOutlet: UIButton!
    
    
    //MARK: Actions
    
    @IBAction func startOver(_ sender: Any) {
        selections.yourGenres = []
        selections.yourPeople = []
        selections.yourFriendGenres = []
        selections.yourFriendPeople = []
        
        viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
        youBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        
    }
    
    @IBAction func viewMovieResults(_ sender: Any) {
        print("hello hello")
        //navigationController?.navigationBar.popItem(animated: true)
    }
    
    //MARK: Unwind Outlets
    
    @IBAction func startOverUnwindToHomeScreenVC(segue:UIStoryboardSegue, sender: UIStoryboardSegue) {
        selections.yourGenres = []
        selections.yourPeople = []
        selections.yourFriendGenres = []
        selections.yourFriendPeople = []
        
        viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
        youBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
    }
    
    @IBAction func youUnwindToHomeScreenVC(segue:UIStoryboardSegue, sender: UIStoryboardSegue) {
        guard let youPeopleViewController = sender.source as? YouPeopleViewController else { return }
        selections.yourGenres = youPeopleViewController.youPeopleSelectionsInstance.yourGenres
        selections.yourPeople = youPeopleViewController.youPeopleSelectionsInstance.yourPeople
        
        //print("\(selections.yourGenres)\n\(selections.yourPeople)\n\(selections.yourFriendGenres)\n\(selections.yourFriendPeople)")
        
        if selections.yourGenres.count == 3 && selections.yourPeople.count == 3 && selections.yourFriendGenres.count == 3 && selections.yourFriendPeople.count == 3 {
            
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 222.0/255.0, green: 208.0/255.0, blue: 152.0/255.0, alpha: 1.0), for: .normal)
            viewResultsButtonOutlet.isEnabled = true
            
        } else if selections.yourGenres.count == 3 && selections.yourPeople.count == 3 {
            
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
            
        } else if selections.yourFriendGenres.count == 3 && selections.yourFriendPeople.count == 3 {
            
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
        } else {
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        }
    }
    
    @IBAction func friendUnwindToHomeScreenVC(segue:UIStoryboardSegue, sender: UIStoryboardSegue) {
        
         guard let yourFriendPeopleViewController = sender.source as? YourFriendPeopleViewController else { return }
         selections.yourFriendGenres = yourFriendPeopleViewController.yourFriendPeopleSelectionsInstance.yourFriendGenres
         selections.yourFriendPeople = yourFriendPeopleViewController.yourFriendPeopleSelectionsInstance.yourFriendPeople
 
        //print("\(selections.yourGenres)\n\(selections.yourPeople)\n\(selections.yourFriendGenres)\n\(selections.yourFriendPeople)")
        if selections.yourGenres.count == 3 && selections.yourPeople.count == 3 && selections.yourFriendGenres.count == 3 && selections.yourFriendPeople.count == 3 {
            
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 222.0/255.0, green: 208.0/255.0, blue: 152.0/255.0, alpha: 1.0), for: .normal)
            viewResultsButtonOutlet.isEnabled = true
            
        } else if selections.yourGenres.count == 3 && selections.yourPeople.count == 3 {
            
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
            
        } else if selections.yourFriendGenres.count == 3 && selections.yourFriendPeople.count == 3 {
            
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-selected")
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
        } else {
            viewResultsButtonOutlet.setTitleColor(UIColor(red: 104.0/255.0, green: 104.0/255.0, blue: 104.0/255.0, alpha: 0.6), for: .normal)
            youBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
            yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        }
    }
    

    //MARK: ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.isNavigationBarHidden = true
        youBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        yourFriendBubbleImageView.image = #imageLiteral(resourceName: "bubble-empty")
        
    }
   
    //MARK: Navgation Helper Functions
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Prepare For Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "youChooseSegue") {
            guard let youGenreViewController = segue.destination as? YouGenreViewController else { return }
            youGenreViewController.youGenreSelectionsInstance = selections
        } else if (segue.identifier == "yourFreindChoosesSegue") {
            guard let yourFriendGenreViewController = segue.destination as? YourFriendGenreViewController else { return }
            yourFriendGenreViewController.yourFriendGenreSelectionsInstance = selections
        } else if (segue.identifier == "movieResults") {
            guard let yourResultsViewController = segue.destination as? YourResultsTableViewController else { return }
            
            selections.matchFinder()
            
            
            let endpoint = TMDBAPI.moviesInGenreWithPerson(apiKey: DiscoverOptions.apiKey.rawValue, language: DiscoverOptions.languageEnglishUS.rawValue, sortBy: DiscoverOptions.sortByDescendingPopularity.rawValue, includeAdult: DiscoverOptions.isFalse.rawValue, includeVideo: DiscoverOptions.isFalse.rawValue, page: DiscoverOptions.page1.rawValue, withGenreID: selections.genreMatchValues, people: selections.peopleMatchValues)
            
            print(endpoint.request)
            
            //here i will have to generate the endpoint.request URL which suggests i have to include the api_key in this file
            
            yourResultsViewController.yourMoviesResultsInstance = selections
        }
    }
}

