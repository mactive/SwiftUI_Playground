//
//  optional.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/14.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation

struct UserStruct {
    var name: String
    // String?  default nil
    var password: String?
}

struct UserStruct2 {
    var name: String
    // Optional<Int> 不会有default 需要自己指定
    var age: Optional<Int>
}

class optionalClass {
    init() {
        let user1 = UserStruct(name: "Moodo", password: "mac")
        let user2 = UserStruct(name: "Tim")
        print(user1, user2)
        
        let user3 = UserStruct2(name: "George", age: 12)
//        let user4 = UserStruct2(name: "Cook") // 不指定age 会报错
        let user4 = UserStruct2(name: "Cook", age: nil)
        print(user3, user4)
        compare()
        optionalTry()
    }
    
    func compare() {
        let newScore: Int? = nil // type Optional<Int>
        let maxScore: Int = 50  // type Int
        if newScore == maxScore {
            print("You matched the high scores")
        }
        // 不可以直接用> 因为 类型不同不能 Equatable
        if newScore ?? 40 > maxScore {
            print("You rocks")
        }
    }
    
    // https://appventure.me/guides/optionals/extending_optionals.html 收到了这里的启发
    func optionalTry() {
        let op: Optional<Int> = nil
        print("optionalTry", op.orZero())
        print("optionalTry", op)
    }
    
    
}
/**
 As a simple test, try writing an orZero property on optionals when their wrapped value is some sort of Numeric type. This will return self (the wrapped value) if there is one, otherwise 0.
 为 Optional 增加非零的 兜底方法
 */
extension Optional where Wrapped: Numeric {
    func orZero() -> Wrapped {
        if self != nil {
            return self as! Wrapped
        } else {
            return 0
        }
    }
}
