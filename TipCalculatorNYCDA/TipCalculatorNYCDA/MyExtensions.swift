//
//  MyExtensions.swift
//  TipCalculator
//
//  Created by NYCDA One on 2/11/15.
//  Copyright (c) 2015 NYCDA. All rights reserved.
//

import Foundation


extension Array
{
    
    private var randomIndex: Int{
        return Int(arc4random_uniform(UInt32(self.count)))
    }
    
    var randomObject: T!{
        if self.count > 0
        {
            return self[randomIndex]
        }
        else
        {
            return nil
        }
    }
    
}