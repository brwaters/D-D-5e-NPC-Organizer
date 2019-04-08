//
//  ViewController.swift
//  D&D 5e NPC Organizer
//
//  Created by Brendon Waters on 2019-03-01.
//  Copyright © 2019 Brendon Waters. All rights reserved.
//

import UIKit
import os

class   ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //This ViewController controls the EditView. Instantiates a character and renders it. Then has a prepare function that captures user entered data and passes it the the segue to be picked up the the TableViewController.

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupDefaultCharacter()
        
    }

    var customCharacter: CharacterItem?
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    func setupDefaultCharacter() {
        var defaultCharacter = CharacterItem.init(image: #imageLiteral(resourceName: "undead"), name: "Strahd Von Zarovich", description: "Medium Undead")
        
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
        miscellaneousText.text = defaultCharacter.miscellaneous
        
        strText.text = defaultCharacter.abilityScore["STR"]
        dexText.text = defaultCharacter.abilityScore["DEX"]
        conText.text = defaultCharacter.abilityScore["CON"]
        intText.text = defaultCharacter.abilityScore["INT"]
        wisText.text = defaultCharacter.abilityScore["WIS"]
        chaText.text = defaultCharacter.abilityScore["CHA"]
        
        abilitiesText.text = defaultCharacter.abilities
        
        actionsText.text = defaultCharacter.actions
        
        legendaryActionsText.text = defaultCharacter.legendaryActions
        
        lairActionsText.text = defaultCharacter.lairActions
    }
    
    
    @IBAction func imagePick(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        self.present(imagePickerController, animated:true, completion:nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            os_log("Missing image in %@", log: OSLog.default, type: .debug, info)
            return
        }
        characterAvatar.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        if presentingViewController is UINavigationController {
            // Add
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController {
            // Edit
            owningNavigationController.popViewController(animated: true)
        }

    }
    
    
    @IBOutlet weak var characterAvatar: UIImageView!
    @IBOutlet weak var nameText: UITextView!
    @IBOutlet weak var characteristicsText: UITextView!
    @IBOutlet weak var alignmentText: UITextField!
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        guard let button = sender as? UIBarButtonItem, button === saveButton
//        else {
//            return
//        }
        
        customCharacter = CharacterItem.init(image: characterAvatar.image ?? #imageLiteral(resourceName: "Character Silhouette") , name: nameText.text, description: characteristicsText.text)
        
        customCharacter?.alignment = alignmentText.text ?? ""
        customCharacter?.armorClass = armorClassText.text ?? ""
        customCharacter?.hitPoints = hitPointsText.text ?? ""
        customCharacter?.speed = speedText.text ?? ""
        customCharacter?.challengeRating = challengeRatingText.text ?? ""
        customCharacter?.languages = languagesText.text ?? ""
        customCharacter?.savingThrows = savingThrowsText.text ?? ""
        customCharacter?.skills = skillsText.text ?? ""
        customCharacter?.damageResistance = damageResistanceText.text ?? ""
        customCharacter?.damageVulnerability = damageVulnerabilitiesText.text ?? ""
        customCharacter?.senses = sensesText.text ?? ""
        customCharacter?.miscellaneous = miscellaneousText.text ?? ""
        
        customCharacter?.abilityScore["STR"] = strText.text ?? ""
        customCharacter?.abilityScore["DEX"] = dexText.text ?? ""
        customCharacter?.abilityScore["CON"] = conText.text ?? ""
        customCharacter?.abilityScore["INT"] = intText.text ?? ""
        customCharacter?.abilityScore["WIS"] = wisText.text ?? ""
        customCharacter?.abilityScore["CHA"] = chaText.text ?? ""
        
        customCharacter?.abilities = abilitiesText.text ?? ""
        customCharacter?.actions = actionsText.text ?? ""
        customCharacter?.legendaryActions = legendaryActionsText.text ?? ""
        customCharacter?.lairActions = lairActionsText.text ?? ""
    }
}
