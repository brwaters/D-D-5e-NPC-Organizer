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
        var defaultCharacter = CharacterItem.init(image: #imageLiteral(resourceName: "undead"))
        
        nameText.text = defaultCharacter.name
        characteristicsText.text = defaultCharacter.characterDescription
        alignmentText.text = defaultCharacter.alignment
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
    
    
    @IBOutlet weak var characterAvatar: UIImageView!
    @IBOutlet weak var nameText: UITextView!
    @IBOutlet weak var characteristicsText: UITextView!
    @IBOutlet weak var alignmentText: UITextView!
    
    @IBOutlet weak var armorClassText: UITextField!
    @IBOutlet weak var hitPointsText: UITextField!
    @IBOutlet weak var speedText: UITextField!
    @IBOutlet weak var challengeRatingText: UITextField!
    @IBOutlet weak var langaugesText: UITextField!
    @IBOutlet weak var savingThrows: UITextField!
    @IBOutlet weak var skillsText: UITextField!
    @IBOutlet weak var damageResistanceText: UITextField!
    @IBOutlet weak var damageImmunitiesText: UITextField!
    @IBOutlet weak var sensesText: UITextField!
    @IBOutlet weak var miscellaneousText: UITextField!
    
    @IBOutlet weak var strengthText: UITextView!
    @IBOutlet weak var dexterityText: UITextView!
    @IBOutlet weak var constitutionText: UITextView!
    @IBOutlet var intellectText: [UITextView]!
    @IBOutlet weak var wisdomText: UITextView!
    @IBOutlet weak var charismaText: UITextView!
    
    @IBOutlet weak var abilitiesText: UITextView!
    @IBOutlet weak var actionsText: UITextView!
    @IBOutlet weak var legendaryActionsText: UITextView!
    
    
}

