//
//  TableViewController.swift
//  D&D 5e NPC Organizer
//
//  Created by Brendon Waters on 2019-03-18.
//  Copyright © 2019 Brendon Waters. All rights reserved.
//

import UIKit
import os

class TableViewController: UITableViewController {

    var characterContainer = [CharacterItem]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    func saveItems() {
        if !NSKeyedArchiver.archiveRootObject(characterContainer, toFile: CharacterItem.archiveURL.path) {
            os_log("Cannot save in %@", log: OSLog.default, type: .debug, CharacterItem.archiveURL.path) }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characterContainer.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        // Configure the cell...
        //cell.imageView =
        //cell.contentView.te = "Testing"
        //cell.detailTextLabel = "another test"
        return cell
    }
    
    @IBAction func unwindFromEditView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let customCharacter = sourceViewController.customCharacter {
            // Edit
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                characterContainer[selectedIndexPath.row] = customCharacter
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                // Add
                let newIndexPath = IndexPath(row: characterContainer.count, section: 0)
                characterContainer.append(customCharacter)
                tableView.insertRows(at: [newIndexPath], with: .automatic) // iOS picks animation
            }
            saveItems()
        }
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
