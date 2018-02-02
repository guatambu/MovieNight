//
//  HomeScreenViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/22/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    //MARK: Properties
    
    @IBOutlet weak var youStackView: UIStackView!
    @IBOutlet weak var friendStackView: UIStackView!
    @IBOutlet weak var timeToPickAMovieOutlet: UIButton!
    
    @IBAction func youPickAMovie(_ sender: Any) {
    }
    @IBAction func friendPickAMovie(_ sender: Any) {
    }

    @IBAction func timeToPickAMovie(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

