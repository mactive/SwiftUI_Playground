//
//  StruckIndex.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/28.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation


class DataStruck {
    init() {
        // MARK: -- >> Stack Struct

//        let who = WhoIsFast()
        
        // MARK: -- Generics
        /**
        let tt = generics()

        let t1 = checkPriorityClass()

        let generics2Struct = generics2()

        let generics3Struct = generics3()
         */
        
        // MRAK: -- Optional
//        let o1 = optionalClass()
        
        // MARK:-- StringInterpolation
        let s1 = StringInterpolation()
        
        // MARK: -- >> SortedArray
        /**
        var sortedArray = SortedArray<Int>(comparator: >)
        sortedArray.insert(8)
        sortedArray.insert(10)
        sortedArray.insert(4)
        sortedArray.insert(1)
        print(sortedArray)
        
        var sortedArrayDefaultComparator = SortedArray<Double>()
        sortedArrayDefaultComparator.insert(3.8)
        sortedArrayDefaultComparator.insert(4.1)
        sortedArrayDefaultComparator.insert(1.2)
        sortedArrayDefaultComparator.insert(6.9)
        print(sortedArrayDefaultComparator)
         */
    }
    
    func stackTest() {
        // MARK: -- >> Stack Struct
        var numbers = Stack<Int>()
        numbers.push(2)
        numbers.push(4)
        numbers.push(6)
        print("numbers: \(numbers.pop()!)")
        // MARK: -- << end
        
        
        var names = Stack<String>()
//        print("names: \(names.pop())")  // names: nil
//        print("names: \(names.pop()!)")  // this case error
        names.push("Lenoardo")
        names.push("Michelangelo")
        names.push("Donatello")
        names.push("Raphael")
        print("names: \(names.pop()!)")
        
        
        // MARK: -- peek
        let numberArray = [1, 2, 3, 4, 5]
        let numbers2 = Stack<Int>(numberArray)
        print("peek: \(numbers2.peek()!)")
        
        // MARK: -- ArrayLiteral
        let numbers3: Stack<Int> = [9,8,7,6,5]
        print("peek: \(numbers3.peek()!)")
        print(numbers3.contains(8))
        print(numbers3)
    }
}
