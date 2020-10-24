//
//  StackStruct.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/28.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation

struct Stack<Element> {
    private var array: [Element] = []
    var count:Int { array.count }
    var isEmpty: Bool { array.isEmpty }
    
    // default initializer
    init() { }
    
    init(_ items: [Element]) {
        self.array = items
    }
    
    mutating func push(_ element: Element) {
        array.append(element)
    }
    
    mutating func pop() -> Element? {
        array.popLast()
    }
    
    func peek() -> Element? {
        array.last
    }
    
    func removeAll() -> Bool {
        return true
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.array = elements
    }
}

// MARK:-- print整个 stack 的时候使用
extension Stack: CustomDebugStringConvertible {
    var debugDescription: String {
        var result = "["
        var first = true

        for item in array {
            if first {
                first = false
            } else {
                result += ", "
            }

            debugPrint(item, terminator: "", to: &result)
        }

        result += "]"
        return result
    }
}

extension Stack: Equatable where Element: Equatable {
    // contains 需要元素是可以 Equatable 所以只能写在这里了
    func contains(_ element: Element) -> Bool {
        array.contains(element)
    }
}

extension Stack: Hashable where Element: Hashable { }
extension Stack: Codable where Element: Codable { }

//extension Stack: Encodable where Element: Encodable { }
//extension Stack: Decodable where Element: Decodable { }



