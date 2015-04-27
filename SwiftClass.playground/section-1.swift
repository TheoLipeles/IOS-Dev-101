// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

1 + 2
2 - 3
3 * 4
4 / 5
4.0/5.0

var livesRemaining = 3
livesRemaining = 5
livesRemaining = livesRemaining - 1
livesRemaining -= 1
livesRemaining += 1

let startingLives = 5
// startingLives = 6
livesRemaining = startingLives
livesRemaining = startingLives - 1
livesRemaining = startingLives - livesRemaining

let priceInferred = 19.99
let priceExplicit: Double = 19.99
let onSaleInferred = true
let onSaleExplicit: Bool = false
let nameInferred = "Danny"
let nameExplicit: String = "Danny"

if onSaleInferred {
    println("Price: \(priceInferred - 5)")
} else {
    println("Price: \(priceInferred)")
}
















func print10() {
    for x in 1...10 {
        println(x)
    }
}

print10()


func sumOf(numbers: [Int]) -> Int {
    var sum = 0
    for x in numbers {
        sum += x
    }
    return sum
}

sumOf([1,2,3,4,5,6,7,8,9,10])

func average(numbers: [Int]) -> Int {
    return sumOf(numbers) / countElements(numbers)
}

average([1,2,3,4,5])


func slopeIntercept(m: Int, x: Int, b: Int) -> Int {
    return m * x + b
}















