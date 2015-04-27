// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum Compass {
    case North
    case South
    case West
    case East
}

var direction = Compass.North

if direction == Compass.North {
    println("North")
}

switch direction {
case .North:
    println("North")
case .South:
    println("South")
case .West:
    println("West")
case .East:
    println("East")
}

var score = 570

switch score {
case 1..<10:
    println("level 1")
case 10..<100:
    println("level 2")
case 100..<1000:
    println("level 3")
default:
    println("level ?")
}

// Struct

struct Location {
    var longitude:Double
    var latitude:Double
}

class Address {
    var name:String!
    var address1:String!
    var city:String!
    var state:String!
    
    var location:Location!
}

var myAddress = Address()
myAddress.location = Location(longitude: 1.3434343, latitude: 2.1324224)


//protocols

@objc protocol StreetRules {
    func stopAtRed()
    optional func signalLeft()
}


class Vehicle {
    var make:String!
}

class Car: Vehicle, StreetRules {
    var isFourWheel:Bool!
    func stopAtRed() {
        //hit the breaks
    }
    func signalLeft() {
        //hit the blinker
    }
    
}

class Bike: Vehicle {
    var isDangerous:Bool!
}

class Pedestrian: StreetRules {
    var name:String!
    func stopAtRed() {
        //stop walking
    }
}
















