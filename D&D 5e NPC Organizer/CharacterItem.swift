//
//  Character.swift
//  D&D 5e NPC Organizer
//
//  Created by Brendon Waters on 2019-03-22.
//  Copyright © 2019 Brendon Waters. All rights reserved.
//

import Foundation
import UIKit
import os

class PropertyKey {
    static let image = "image"
    static let name = "name"
    static let description = "description"
    
}


class CharacterItem: NSObject/*, NSCoding*/ {
    
    //    func encode(with aCoder: NSCoder) {
    //        aCoder.encode(image, forKey: PropertyKey.image)
    //        aCoder.encode(name, forKey: PropertyKey.name)
    //    }
    //
    
    // Character identification attributes
    var image: UIImage
    var name: String
    var characterDescription: String
    var alignment: String
    
    // Character Primary Stats
    var armorClass: String
    var hitPoints: String
    var speed: String
    
    // Character Secondary Stats
    var abilityScore: Dictionary<String, String>
    var savingThrows: String
    var skills: String
    var damageResistance: String
    var damageVulnerability: String
    var senses: String
    var languages: String
    var challengeRating: String
    
    // Character Abilities
    var abilities: Dictionary<String, String>
    var actions: Dictionary<String, String>
    var legendaryActions: Dictionary<String, String>
    var lairActions: Dictionary<String, String>
    
    
        override convenience init() {
            self.init(image: #imageLiteral(resourceName: "Character Silhouette"))
        }
        init(image: UIImage) {
            self.image = image
            self.name = "Strahd Von Zarovich"
            self.characterDescription = "Medium undead"
            self.alignment = "Lawful evil"
            
            self.armorClass = "16 (Natural Armor)"
            self.hitPoints = "144 (17d8 + 68)"
            self.speed = "30 ft."
            self.abilityScore = ["STR" : "18 (+4)", "DEX" : "18 (+4)", "CON" : "18 (+4)", "INT" : "20 (+5)", "WIS" : "15 (+2)", "CHA" : "18 (+4)"]
            self.savingThrows = "DEX +9, WIS +7, CHA +9"
            self.skills = "Arcana +15, Perception +12, Religion +10, Stealth +14"
            self.damageResistance = "Necrotic; Bludgeoning, Piercing, and Slashing from Nonmagical Attacks"
            self.damageVulnerability = "None"
            self.senses = "Darkvision 120 ft., Passive Perception 22"
            self.languages = "Abyssal, Common, Draconic, Elvish, Giant, Infernal"
            self.challengeRating = "15 (13,000 XP)"
            
            self.abilities = ["Shapechanger" : "If Strahd isn’t in running water or sunlight, he can use his action to polymorph into a Tiny bat, a Medium wolf, or a Medium cloud of mist, or back into his true form. While in bat or wolf form, Strahd can’t speak. In bat form, his walking speed is 5 feet, and he has a flying speed of 30 feet. In wolf form, his walking speed is 40 feet. His statistics, other than his size and speed, are unchanged. Anything he is wearing transforms with him, but nothing he is carrying does. He reverts to his true form if he dies. While in mist form, Strahd can’t take any actions, speak, or manipulate objects. He is weightless, has a flying speed of 20 feet, can hover, and can enter a hostile creature’s space and stop there. In addition, if air can pass through a space, the mist can do so without squeezing, and he can’t pass through water. He has advantage on Strength, Dexterity, and Constitution saving throws, and he is immune to all nonmagical damage, except the damage he takes from sunlight."]
            self.actions = ["Multiattack (Vampire Form Only" : "Strahd makes two attacks, only one of which can be a bite attack."]
            self.legendaryActions = ["legendaryDescription" : "Strahd can take 3 legendary actions, choosing from the options below. Only one legendary action option can be used at a time and only at the end of another creature’s turn. Strahd regains spent legendary actions at the start of his turn.", "Move" : "Strahd moves up to his speed without provoking opportunity attacks."]
            self.lairActions = ["lairDescriptions" : "While Strahd is in Castle Ravenloft, he can take lair actions as long as he isn’t incapacitated. On initiative count 20 (losing initiative ties), Strahd can take one of the following lair action options, or forgo using any of them in that round:", "actionOne" : "Until initiative count 20 of the next round, Strahd can pass through solid walls, doors, ceilings, and floors as if they weren’t there. Strahd targets any number of doors and windows that he can see, causing each one to either open or close as he wishes. Closed doors can be magically locked (needing a successful DC 20 Strength check to force open) until Strahd chooses to end the effect, or until Strahd uses this lair action again.", "actionTwo" : "Strahd summons the angry spirit of one who has died in the castle. The apparition appears next to a hostile creature that Strahd can see, makes an attack against that creature, and then disappears. The apparition has the statistics of a specter."]
    }
    
    //    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    //    static let archiveURL = documentsDirectory.appendingPathComponent("foodItems")
    //    required convenience init?(coder aDecoder: NSCoder) {
    //        guard let image = aDecoder.decodeObject(forKey: PropertyKey.image) as?
    //            UIImage else {
    //                os_log("Missing image", log: OSLog.default, type: .debug)
    //                return nil
    //        }
    //        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
    //            os_log("Missing name", log: OSLog.default, type: .debug)
    //            return nil
    //        }
    //        self.init(image: image, name: name)
    //    }
}
