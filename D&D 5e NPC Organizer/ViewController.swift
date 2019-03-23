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
        armorClassText.text = defaultCharacter.armorClass
        hitPointsText.text  = defaultCharacter.hitPoints
        speedText.text = defaultCharacter.speed
        challengeRatingText.text = defaultCharacter.challengeRating
        languagesText.text = defaultCharacter.languages
        savingThrowsText.text = defaultCharacter.savingThrows
        skillsText.text = defaultCharacter.skills
        damageResistanceText.text = defaultCharacter.damageResistance
        damageVulnerabilitiesText.text = defaultCharacter.damageVulnerability
        sensesText.text = defaultCharacter.senses
        miscellaneousText.text = "Miscellaneous"
        
        strengthText.text = defaultCharacter.abilityScore["STR"]
        dexterityText.text = defaultCharacter.abilityScore["DEX"]
        constitutionText.text = defaultCharacter.abilityScore["CON"]
        intellectText.text = defaultCharacter.abilityScore["INT"]
        wisdomText.text = defaultCharacter.abilityScore["WIS"]
        charismaText.text = defaultCharacter.abilityScore["CHA"]
        
        abilitiesText.text = defaultCharacter.abilities["Shapechanger"]
        
        actionsText.text = defaultCharacter.actions["Multiattack (Vampire Form Only"]
        
        legendaryActionsText.text = defaultCharacter.actions["legendaryDescription"]
        
        lairActionsText.text = defaultCharacter.actions["lairDescription"]
        
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
    @IBOutlet weak var languagesText: UITextField!
    @IBOutlet weak var savingThrowsText: UITextField!
    @IBOutlet weak var skillsText: UITextField!
    @IBOutlet weak var damageResistanceText: UITextField!
    @IBOutlet weak var damageVulnerabilitiesText: UITextField!
    @IBOutlet weak var sensesText: UITextField!
    @IBOutlet weak var miscellaneousText: UITextField!
    
    @IBOutlet weak var strengthText: UITextView!
    @IBOutlet weak var dexterityText: UITextView!
    @IBOutlet weak var constitutionText: UITextView!
    @IBOutlet weak var intellectText: UITextView!
    @IBOutlet weak var wisdomText: UITextView!
    @IBOutlet weak var charismaText: UITextView!
    
    @IBOutlet weak var abilitiesText: UITextView!
    @IBOutlet weak var actionsText: UITextView!
    @IBOutlet weak var legendaryActionsText: UITextView!
    @IBOutlet weak var lairActionsText: UITextView!
    
    
    
    
}

