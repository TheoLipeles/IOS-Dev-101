//
//  FileUtilities.swift
//  ToDo
//
//  Created by Theodore Lipeles on 2/25/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation

func MyDocumentDirectory() -> NSURL {
    
    let fileManager = NSFileManager()
    let urls = (fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL])
    
    return urls[0]
    
}