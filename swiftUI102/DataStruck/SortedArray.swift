//
//  SortedArray.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/11.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation
struct SortedArray<Element>: CustomStringConvertible where Element:  Comparable {
    private var items = [Element]()
    var count: Int { items.count}
    var description: String { items.description }
    
    mutating func insert(_ element: Element) {
        items.append(element)
        items.sort()
    }
    
    mutating func remove(at index: Int) {
        items.remove(at: index)
    }
}

