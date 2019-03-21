//
//  ViewController.swift
//  D&D 5e NPC Organizer
//
//  Created by Brendon Waters on 2019-03-01.
//  Copyright © 2019 Brendon Waters. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

    }

    @IBAction func cancelButton(_ sender: Any) {
        if presentingViewController is UINavigationController {
            // Add
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController { // Edit
            owningNavigationController.popViewController(animated: true)
        }

    }
    
}

