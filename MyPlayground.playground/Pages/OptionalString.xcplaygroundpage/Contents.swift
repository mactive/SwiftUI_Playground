//: [Previous](@previous)

import Foundation

var str = "Hello, playground"
func getHaterStatus(_ weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}


func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    } else {
        print("nothing")
    }
}


var status = getHaterStatus("sunny")


if let unwarppedStatus = status {
    takeHaterAction(status: unwarppedStatus)
} else {
    print("unwarppedStatus invalid")
}



//: [Next](@next)
