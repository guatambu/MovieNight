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
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
