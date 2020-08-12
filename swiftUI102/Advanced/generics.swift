//
//  generics.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/12.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation

class generics {
    
    func count<T: Numeric>(numbers: [T]) {
        let total = numbers.reduce(0, +)
        let className = NSStringFromClass(type(of: self))
        print("\(className) Total is \(total)")
    }
    
    init() {
        count(numbers: [1, 1.3, 4.2])
        count(numbers: [0.1, 3, 87])
    }
}

// MARK: -- another kind

protocol Prioritized {
    var priority: Int { get }
    func alterIfImportant()
}

struct Work: Prioritized {
    let priority: Int
    func alterIfImportant() {
        if priority > 3 {
            print("I'm important work")
        } else {
            print("I'm not important work")
        }
    }
}

struct Document: Prioritized {
    let priority: Int
    func alterIfImportant() {
        if priority > 5 {
            print("I'm important document")
        } else {
            print("I'm not important document")
        }
    }
}

//func checkPriority(of item: Prioritized) {
//    print("Checking priority...")
//    item.alterIfImportant()
//}



class checkPriorityClass {
    
    func checkPriority<P: Prioritized>(of item: P) {
        print("Checking priority...")
        item.alterIfImportant()
    }
    
    init() {
        let theWork: Work = Work(priority: 4)
        let theDoc = Document(priority: 3)
        checkPriority(of: theWork)
        checkPriority(of: theDoc)
    }
}

