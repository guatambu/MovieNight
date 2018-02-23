//
//  YourMovieFinalViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/30/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YourMovieFinalViewController: UIViewController {

    //MARK:  Properties
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!

    //MARK: Actions
    
    @IBAction func startOverButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        let homeScreenViewController = HomeScreenViewController()
        self.present(homeScreenViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = false

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
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
    


}
