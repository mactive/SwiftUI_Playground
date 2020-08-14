//
//  generics3.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/13.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

// Extending with generic parameters
// 通过扩展和泛型 来增加约束方法

import Foundation

struct UserItem {
    var name: String
}

struct generics3 {
    var array = [1, 2, 1, 2, 4, 3, 1, 3, 5]

    init() {
        
        // MARK: 系统提供的方法会改动原有数据, 然后返回Bool值
//        array.removeAll(where: { $0 == 1})
//        print("generics3 removeAll", array)
        
        
        // MARK:  But what if you wanted to remove the items in a copy, rather than removing them in place?
        

        let removingArr = array.removing(1)
        print("generics3 removingArr", removingArr)
        print("generics3 original", array)
        
        let removingDuplicatesArr = array.removingDuplicates()
        print("generics3 removingDuplicatesArr", removingDuplicatesArr)
        
        trySequence()

    }
    
    func trySequence() {
        let user1 = UserItem(name: "User1")
        let user2 = UserItem(name: "User2")
        let user3 = UserItem(name: "User3")
        let user4 = UserItem(name: "User1")
        let users = [user1, user2, user3, user4]
        // 名字唯一的用户
        let uniqueUsers = users.uniqueElements(byProperty: \.name)
        print("generics3 uniqueUsers", uniqueUsers)
    }
    
}


// MARK: Equatable
extension Array where Element: Equatable {
    mutating func removing(_ obj: Element) -> [Element] {
        filter{ $0 != obj }
    }
}

// MARK: Hashable
extension Array where Element: Hashable {
    func removingDuplicates() -> [Element] {
        var seen = Set<Element>()
        return filter {
            seen.insert($0).inserted
        }
    }
}


// MARK: propertyAccessor property获取器
extension Sequence {
    func uniqueElements<T: Hashable>(byProperty propertyAccessor: (Element) -> T) -> [Element] {
        var seen = Set<T>()
        var result = [Element]()
        
        for element in self {
            let property = propertyAccessor(element)
            if seen.contains(property) == false {
                result.append(element)
                seen.insert(property)
            }
        }
        return result
    }
}





