//
//  DetailViewController.swift
//  D&D 5e NPC Organizer
//
//  Created by Brendon Waters on 2019-04-05.
//  Copyright © 2019 Brendon Waters. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedCharacter: CharacterItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        nameText.text = selectedCharacter?.name
        chracteristicsText.text = selectedCharacter?.characterDescription
        alignmentText.text = selectedCharacter?.alignment
        armorText.text = selectedCharacter?.armorClass
        hitpointsText.text  = selectedCharacter?.hitPoints
        speedText.text = selectedCharacter?.speed
        challengeRatingText.text = selectedCharacter?.challengeRating
        languagesText.text = selectedCharacter?.languages
        savingThrowsText.text = selectedCharacter?.savingThrows
        skillsText.text = selectedCharacter?.skills
        damageResistanceText.text = selectedCharacter?.damageResistance
        damageVulnerabilityText.text = selectedCharacter?.damageVulnerability
        sensesText.text = selectedCharacter?.senses
        miscellaneousText.text = selectedCharacter?.miscellaneous
        
        strText.text = selectedCharacter?.abilityScore["STR"]
        dexText.text = selectedCharacter?.abilityScore["DEX"]
        conText.text = selectedCharacter?.abilityScore["CON"]
        intText.text = selectedCharacter?.abilityScore["INT"]
        wisText.text = selectedCharacter?.abilityScore["WIS"]
        chaText.text = selectedCharacter?.abilityScore["CHA"]
        
        abilitiesText.text = selectedCharacter?.abilities
        actionsText.text = selectedCharacter?.actions
        legendaryActionsText.text = selectedCharacter?.legendaryActions
        lairActionsText.text = selectedCharacter?.lairActions
    }
    
    @IBOutlet weak var characterAvatar: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var chracteristicsText: UITextField!
    @IBOutlet weak var alignmentText: UITextField!
    
    @IBOutlet weak var armorText: UITextField!
    @IBOutlet weak var hitpointsText: UITextField!
    @IBOutlet weak var speedText: UITextField!
    @IBOutlet weak var challengeRatingText: UITextField!
    @IBOutlet weak var languagesText: UITextField!
    @IBOutlet weak var savingThrowsText: UITextField!
    @IBOutlet weak var skillsText: UITextField!
    @IBOutlet weak var damageResistanceText: UITextField!
    @IBOutlet weak var damageVulnerabilityText: UITextField!
    @IBOutlet weak var sensesText: UITextField!
    @IBOutlet weak var miscellaneousText: UITextField!
    
    
    @IBOutlet weak var strText: UITextField!
    @IBOutlet weak var dexText: UITextField!
    @IBOutlet weak var conText: UITextField!
    @IBOutlet weak var intText: UITextField!
    @IBOutlet weak var wisText: UITextField!
    @IBOutlet weak var chaText: UITextField!
    
    @IBOutlet weak var abilitiesText: UITextView!
    @IBOutlet weak var actionsText: UITextView!
    @IBOutlet weak var legendaryActionsText: UITextView!
    @IBOutlet weak var lairActionsText: UITextView!
    
    
    @IBAction func cancel(_ sender: Any) {
        if presentingViewController is UINavigationController {
            // Add
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController {
            // Edit
            owningNavigationController.popViewController(animated: true)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let navigationController = segue.destination as? UINavigationController,
            let editViewController = navigationController.viewControllers.first as?
            ViewController {
            editViewController.customCharacter = selectedCharacter
        }
    }
}
