//
//  YourResultsTableViewController.swift
//  MovieNight
//
//  Created by Michael Guatambu Davis on 1/30/18.
//  Copyright © 2018 leme group. All rights reserved.
//

import UIKit

class YourResultsTableViewController: UITableViewController {
    
    //MARK: Properties
    
    var dataSource = MovieResultsDataSource()
    var yourMoviesResultsInstance: MovieResults!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationController?.navigationBar.titleTextAttributes  = [NSAttributedStringKey(rawValue: NSAttributedStringKey.foregroundColor.rawValue): UIColor(red: 222.0/255.0, green: 208.0/255.0, blue: 152.0/255.0, alpha: 1.0), NSAttributedStringKey.font:UIFont(name:"Helvetica-Bold", size: 18)!]
        self.navigationController?.navigationBar.tintColor = UIColor(red: 222.0/255.0, green: 208.0/255.0, blue: 152.0/255.0, alpha: 1.0)
        UIApplication.shared.statusBarView?.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-iphone6plus")!)
        
        
        //Load Sample Data
        tableView.dataSource = dataSource
        updateTableViewDataSource(for: tableView)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    



   

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let yourMovieFinalViewController = segue.destination as? YourMovieFinalViewController else { return }
        //yourMovieFinalViewController.finalMoviePickInstance = *(# object contained in user selected cell #)*
    }

}

extension YourResultsTableViewController {
    func updateTableViewDataSource(for tableView: UITableView) {
        dataSource.update(with: StubData.movie)
        tableView.reloadData()
    }
}
