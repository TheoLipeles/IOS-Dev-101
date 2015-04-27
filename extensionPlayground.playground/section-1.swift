// Playground - noun: a place where people can play

import UIKit

var array = [1,3,5,7,9,11]







extension Array {
    var randomIndex: Int {
        return Int(arc4random_uniform(UInt32(self.count)))
    }
    
    var randomObject: T! {
        if self.count > 0 {
            return self[randomIndex]
        } else {
            return nil
        }
    }
    
    mutating func remove() ->T! {
        if self.count > 0 {
            return self.removeAtIndex(randomIndex)
        } else {
            return nil
        }
    }
    
}

array.remove()