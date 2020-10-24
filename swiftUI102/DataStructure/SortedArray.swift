//
//  SortedArray.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/11.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation
struct SortedArray<Element>: CustomStringConvertible, RandomAccessCollection {
    private var items = [Element]()
    var count: Int { items.count}
    var description: String { items.description }
    var startIndex: Int { items.startIndex }
    var endIndex: Int { items.endIndex }
    
    var sortBefore: (Element, Element) -> Bool
    
    init(comparator: @escaping (Element, Element) -> Bool) {
        self.sortBefore = comparator
    }
    
    subscript(position: Int) -> Element {
        items[position]
    }
    
    mutating func insert(_ element: Element) {
        for (i, item) in items.enumerated() {
            if sortBefore(element, item) {
                print("element \(element)")
                items.insert(element, at: i)
                return
            }
        }
        items.append(element)
    }
    
    // 在没有增加 RandomAccessCollection 之前的insert实现
//    mutating func insert(_ element: Element) {
//        items.append(element)
//        items.sort()
//    }
    
    mutating func remove(at index: Int) {
        items.remove(at: index)
    }
}

extension SortedArray where Element: Comparable {
    init() {
        self.init(comparator: <)
    }
}

