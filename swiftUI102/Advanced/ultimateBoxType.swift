//
//  ultimateBoxType.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/9/1.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation

final class Box<Type> {
    var value: Type
    init(_ value: Type) {
        self.value = value
    }
    
    func map<Other>(_ function: (Type) throws -> Other) rethrows -> Box<Other> {
        Box<Other>(try function(value))
    }
}

// print(boxedScore)
// swiftUI102.Box<Swift.Int>  -> Int.rawValue
extension Box:CustomStringConvertible where Type: CustomStringConvertible {
    var description: String {
        value.description
    }
}

extension Box: Equatable where Type: Equatable {
    static func ==(lhs: Box, rhs: Box) -> Bool {
        lhs.value == rhs.value
    }
}

extension Box: Comparable where Type: Comparable {
    static func <(lhs: Box, rhs: Box) -> Bool {
        lhs.value < rhs.value
    }
}


// MARK: -- struct with struct

struct UniStore {
    var name: String
    var address: String
    var isOpen: Bool
}

struct HomeScreen {
    let store: Box<UniStore>
//    let store: UniStore // one change another will not change
}

struct SecondScreen {
    let store: Box<UniStore>
//    let store: UniStore // one change another will not change
}



class TryBox {
    
    init() {
        let score = 10
        let boxedScore = Box(score)
        let secondBox = boxedScore
        let thirdBox = boxedScore
        thirdBox.value = 20
        print(thirdBox.value)
        print(secondBox.value)
        print(boxedScore.value)
        print(boxedScore)
        
        let fourthBox = Box(11)
        print(boxedScore == secondBox)
        print(boxedScore < fourthBox)
        
        // MARK: -- Can you write a map() method that transforms our boxed value into another kind of boxed value, for example a Box<String> into a Box<Int>?
        let finalBox = fourthBox.map {
            // item to string
            String($0)
        }
        print(finalBox)
        changeTogather()
        
    }
    
    //MRAK: -- https://www.hackingwithswift.com/plus/intermediate-swift/the-ultimate-box-type
    
    // change togather
    func changeTogather() {
        var unistore = UniStore(name: "Uni", address: "Tongzhou", isOpen: true)
        let uniBoxStore = Box(unistore)
        let t1 = HomeScreen(store: uniBoxStore)
        let t2 = SecondScreen(store:uniBoxStore)
        print(t1.store.value)
        print(t2.store.value)
        // change unistore is useless
//        unistore.isOpen = false // useless,
        // should change uniBoxStore
        // change once and twoStruct will be changed
        uniBoxStore.value.name = "Uni John"
        uniBoxStore.value.isOpen = false
        print(t1.store.value)
        print(t2.store.value)
    }
    
}

