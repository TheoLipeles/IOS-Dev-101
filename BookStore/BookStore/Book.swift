//
//  Book.swift
//  BookStore
//
//  Created by Theodore Lipeles on 3/9/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation
import CoreData


@objc(Book)
class Book: NSManagedObject {

    @NSManaged var bookTitle: String

}
