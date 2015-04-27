// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Square {
    var length: Int = 1
    
    init(length: Int) {
        self.length = length
    }
    
    func area() ->Int {
        return length * length
    }
    
    func perimeter() ->Int {
        return length * 4
    }
}

class Rectangle {
    var length: Float = 0.0
    var width: Float = 0.0
    
    func area() ->Float {
        return (length * width)
    }
    
    func perimeter() ->Float {
        return (2 * length) + (2 * width)
    }
}

var firstSquare = Square(length: 3)
var secondSquare = Square(length: 10)

var firstSquarePerimeter = firstSquare.perimeter()
var firstSquareArea = firstSquare.area()


println("Hello,\n\tMy name is...")