//
//  Theater.swift
//  MovieTheaterApp
//
//  Created by Theodore Lipeles on 3/11/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation
import CoreData

@objc(Theater)
class Theater: NSManagedObject {

    @NSManaged var theaterName: String
    @NSManaged var location: String
    @NSManaged var movies: NSSet

}
