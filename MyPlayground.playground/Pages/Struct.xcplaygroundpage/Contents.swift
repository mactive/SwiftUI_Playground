//: [Previous](@previous)

import Foundation

struct Person {
    var clothes: String
    var shoes: String
}

var str = "Hello, playground"
let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
var taylorCopy = taylor
taylorCopy.shoes = "flip flops"
print(taylor)
print(taylorCopy)
//: [Next](@next)
