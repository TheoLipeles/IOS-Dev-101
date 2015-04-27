//
//  Address.swift
//  MyTableApp
//
//  Created by Theodore Lipeles on 2/28/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation

class Address: NSObject, NSCoding{
    var name:String?
    var address:String?
    var city:String?
    var imageFileName:String?
    
    override init() {
        
    }
    
    required init(coder aDecoder: NSCoder) {
        self.name = aDecoder.decodeObjectForKey("name") as String?
        self.address = aDecoder.decodeObjectForKey("address") as String?
        self.city = aDecoder.decodeObjectForKey("city") as String?
        self.imageFileName = aDecoder.decodeObjectForKey("imageFileName") as String?
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.name, forKey: "name")
        aCoder.encodeObject(self.address, forKey: "address")
        aCoder.encodeObject(self.city, forKey: "city")
        aCoder.encodeObject(self.imageFileName, forKey: "imageFileName")
    }

}