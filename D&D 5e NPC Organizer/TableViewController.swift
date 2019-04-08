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
    
    // Provides View for TableView. Loads and saves characters into collection of characters. Sends index of cell selected by conditional in prepare fucntion to segue to be picked up by DetailView for rendering character to user.

    var characterContainer = [CharacterItem]();
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.backgroundView = UIImageView(image: #imageLiteral(resourceName: "Background"))
        if let savedCharacters = loadItems() {
            characterContainer += savedCharacters
        }
    }

    // MARK: - Table view data source
    func saveItems() {
        if !NSKeyedArchiver.archiveRootObject(characterContainer, toFile: CharacterItem.archiveURL.path) {
            os_log("Cannot save in %@", log: OSLog.default, type: .debug, CharacterItem.archiveURL.path) }
    }
    
    func loadItems() -> [CharacterItem]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: CharacterItem.archiveURL.path) as? [CharacterItem]
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
        let item = characterContainer[indexPath.row]
        cell.imageView?.image = item.image
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.characterDescription
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            // Delete the row from the data source
            characterContainer.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "viewDetail" {
            guard let selectedTableViewCell = sender as? UITableViewCell else {
                fatalError("Couldn't get sender.")
            }
            guard let selectedCellIndexPath = tableView.indexPath(for: selectedTableViewCell) else {
                fatalError("Couldn't get indexPath of selected cell")
            }
            if let nextViewController = segue.destination as? DetailViewController {
                nextViewController.selectedCharacter = characterContainer[selectedCellIndexPath.row]
                //Or pass any values
            }
        }
    }

}
