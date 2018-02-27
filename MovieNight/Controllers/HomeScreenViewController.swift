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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    @IBOutlet weak var youStackViewOutlet: UIStackView!
    @IBOutlet weak var yourFriendStackViewOutlet: UIStackView!
    
    @IBOutlet weak var viewResultsButtonOutlet: UIButton!
    
    @IBAction func startOver(_ sender: Any) {
    }
    
    @IBAction func viewMovieResults(_ sender: Any) {
        print("hello hello")
        //navigationController?.navigationBar.popItem(animated: true)
    }
    
    
    //MARK: Actions
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
   
    
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


}

