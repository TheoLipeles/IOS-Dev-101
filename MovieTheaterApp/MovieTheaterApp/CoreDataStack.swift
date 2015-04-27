//
//  CoreDataStack.swift
//  MovieTheater
//
//  Created by Theodore Lipeles on 3/11/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    let context:NSManagedObjectContext
    let storeCoordinator:NSPersistentStoreCoordinator
    let model:NSManagedObjectModel
    let store:NSPersistentStore?
    
    let dbName = "MovieTheater"
    
    init() {
        // Model
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource(dbName, withExtension: "momd")
        model = NSManagedObjectModel(contentsOfURL: modelURL!)!
        
        // Store Coordinator
        storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        // Context
        context = NSManagedObjectContext()
        context.persistentStoreCoordinator = storeCoordinator
        
        // Store
        
        let documentsURL = MyDocumentDirectory()
        let storeURL = documentsURL.URLByAppendingPathComponent(dbName)
        
        let options = [NSInferMappingModelAutomaticallyOption:true]
        
        var error:NSError?
        
        store = storeCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil, error: &error)
        
        if store == nil {
            println("error adding persistent store: \(error)")
            abort()
        }
        
    }
    
    func saveContext() {
        
        var error:NSError?
        if context.hasChanges && !context.save(&error) {
            
        }
        
    }
    
}
