//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

func yearAlbumReleased(_ name: String) -> Int? {
    let year: Int?
    switch name {
    case "Taylor Swift":
        year = 2006
    case "Fearless":
        year = 2008
    case "Speak Now":
        year = 2010
    case "Red":
        year = 2012
    case "1989":
        year = 2014
    default:
        year = nil
    }
    return year
}

let year = yearAlbumReleased("Fearless") ?? 2009

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year)")
}
//: [Next](@next)
