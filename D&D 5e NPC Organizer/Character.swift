//
//  Character.swift
//  D&D 5e NPC Organizer
//
//  Created by Brendon Waters on 2019-03-22.
//  Copyright © 2019 Brendon Waters. All rights reserved.
//

import Foundation


import Foundation
import UIKit
import os

class PropertyKey {
    static let image = "image"
    static let name = "name"
    static let description = "description"
    
}


class Character: NSObject, NSCoding {
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(name, forKey: PropertyKey.name)
    }
    
    var image: UIImage
    var name: String

    override convenience init() {
        self.init(image: #imageLiteral(resourceName: "defaultImage"), name: "Test Character")
    }
    init(image: UIImage, name: String) {
        self.image = image
        self.name = name
}
    
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("foodItems")
    required convenience init?(coder aDecoder: NSCoder) {
        guard let image = aDecoder.decodeObject(forKey: PropertyKey.image) as?
            UIImage else {
                os_log("Missing image", log: OSLog.default, type: .debug)
                return nil
        }
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Missing name", log: OSLog.default, type: .debug)
            return nil
        }
        self.init(image: image, name: name)
    }
}
