//
//  generics2.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/12.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation
struct Pair<T> {
    let first: T
    let second: T
}

let names = Pair(first: "Meng", second: "Mac")
let names2 = Pair(first: 43, second: 23)

struct Point<T: Numeric> {
    let x: T
    let y: T
}

let float: Point<Float> = Point(x: 1.4, y: 1.4)
let double: Point<Double> = Point(x: 3.2, y: 3.22)

// 可以约束泛型的类型, 这里要求是 Hashable
struct CountSet<Element: Hashable>: Equatable, Hashable {
    private var elements = [Element: Int] ()
    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }
    
    mutating func insert(_ element: Element) {
        elements[element, default: 0] += 1
    }
    
    mutating func remove(_ element: Element) {
        elements[element, default: 0] -= 1
    }
    
    func count(for element:Element) -> Int {
        return elements[element, default: 0]
    }
}

class generics2 {
    init() {
        var scores = CountSet<String>()
        scores.insert("Big")
        scores.insert("Medium")
        scores.insert("Big")
        scores.insert("Big")
        scores.insert("Big")
        scores.insert("Small")
        print("scores big \(scores.count(for: "Big")) times")
        print("scores small \(scores.count(for: "Small")) times")
    }
}

