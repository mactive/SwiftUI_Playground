//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//for i in 1...100 where i % 5 == 0 {
//    print(i)
//}

let songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]
for song in songs {
    if song == "You Belong with Me" {
        // 跳过后面的语句
        // if 循环并不会加深层级
        continue
    }
    print(song)
}


//: [Next](@next)
