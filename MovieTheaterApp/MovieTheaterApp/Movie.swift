//
//  Movie.swift
//  MovieTheaterApp
//
//  Created by Theodore Lipeles on 3/11/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation
import CoreData

@objc(Movie)
class Movie: NSManagedObject {

    @NSManaged var movieTitle: String
    @NSManaged var rating: NSNumber
    @NSManaged var director: Director
    @NSManaged var theaters: NSSet

}
