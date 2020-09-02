//
//  whileloop.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/18.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation

class whileLoop {
    init() {
        var count  = 0
        while count < 10 {
            print("Counting up: \(count)")
            count += 1
        }
        
        mapPractice()
        forinPractice()
        forinLoop()
    }
    
    func mapPractice() {
        let values = [2.0, 4.0, 5.0, 7.0]
        let squares = values.map { (item) -> Double in
            item * item
        }
        print(squares)
        
        values.forEach { item in
            print("Item: \(item)")
        }
        
        let squares2 = values.map { $0 * 2}
        print(squares2)
    }
    func forinPractice() {
        let values = [2.0, 4.0, 5.0, 7.0]

        for item in values {
            print("values for in: \(item)")
        }
        
        for item in 1...10 {
            print("values for in 1...10: \(item)")
        }
    }
    
    func forinLoop() {
        var people = ["players", "doctors", "farmers"]
        var actions = ["gaming", "curing", "planeting"]
        
        for personIndex in 0..<people.count {
            for action in actions {
                var str = "\(people[personIndex]) gonna "
                str += action
                print(str)
            }
        }
    }
}
