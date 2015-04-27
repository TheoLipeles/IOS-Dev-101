//
//  Director.swift
//  MovieTheaterApp
//
//  Created by Theodore Lipeles on 3/11/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation
import CoreData

@objc(Director)
class Director: NSManagedObject {

    @NSManaged var fullName: String
    @NSManaged var movies: NSSet

}
