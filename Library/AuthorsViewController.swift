//
//  AuthorsViewController.swift
//  Library
//
//  Created by Ahmad Ghadiri on 2/11/18.
//  Copyright © 2018 AhmadGhadiri. All rights reserved.
//

import UIKit

class AuthorsViewController: UITableViewController {
    
    // Properties
    let CellIdentifier = "Cell Identifier"
    var authors = [AnyObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Title
        title = "Authors"
        
        // Load Authors
        let filePath = Bundle.main.path(forResource: "Books", ofType: "plist")
        if let path = filePath {
            authors = NSArray(contentsOfFile: path)! as [AnyObject]
        }
        
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CellIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return authors.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue Resuable Cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier, for: indexPath)
        
        if let author = authors[indexPath.row] as? [String: AnyObject], let name = author["Author"] as? String {
            // Configure Cell
            cell.textLabel?.text = name
        }
        
        return cell;
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
