//
//  MyFileManager.swift
//  MyTableApp
//
//  Created by Theodore Lipeles on 2/28/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation

func MyDocumentDirectory() ->NSURL {
    
    return (NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask) as [NSURL])[0]
    
}

func readFile(url:NSURL) ->AnyObject? {
    return NSKeyedUnarchiver.unarchiveObjectWithFile(url.path!)
}

func writeFile(rootObject:AnyObject, url:NSURL) ->Bool {
    return NSKeyedArchiver.archiveRootObject(rootObject, toFile: url.path!)
}

func fileExists(url:NSURL) ->Bool {
    return NSFileManager().fileExistsAtPath(url.path!)
}

func fileUrl(filename: String) ->NSURL {
    return MyDocumentDirectory().URLByAppendingPathComponent(filename)
}