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
    
    var finalMoviePickInstance: Selections!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent // .default
    }
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: UIImageView!

    //MARK: Actions
    
    @IBAction func startOver(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToHomeScreenViewController", sender: self)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes  = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor(red: 222.0/255.0, green: 208.0/255.0, blue: 152.0/255.0, alpha: 1.0), NSAttributedStringKey.font:UIFont(name:"Helvetica-Bold", size: 18)!]
        self.navigationController?.navigationBar.tintColor = UIColor(red: 222.0/255.0, green: 208.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide the navigation bar on the this view controller
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
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
