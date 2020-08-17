//
//  stringInterpolation.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/17.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation



extension String.StringInterpolation {
//    mutating func appendInterpolition(_ value: String) {
//
//    }
    mutating func appendInterpolation(_ value: Int) {
        let stringForm = String(value)
        
        if value < 0 {
            appendLiteral(stringForm)
        } else {
            appendLiteral("+" + stringForm)
        }
    }
    
    // 匿名 参数名 默认生效
    mutating func appendInterpolation(_ values: [String]) {
        let joined = ListFormatter.localizedString(byJoining: values)
        appendLiteral(joined)
    }
    
    // 增加参数标识 可以做一些特殊的操作
    mutating func appendInterpolation(singed values: [String]) {
        let joined = values.joined(separator: " -- ")
        appendLiteral(joined)
    }
    
    // Multiple parameters
    mutating func appendInterpolation(_ value: Date, date: DateFormatter.Style = .none, time: DateFormatter.Style = .none) {
        let formatter = DateFormatter()
        formatter.dateStyle = date
        formatter.timeStyle = time
        appendLiteral(formatter.string(from: value))
    }
}

class StringInterpolation {
    init() {
        let name = "Paul"
        let score  = 9001
        print("\(name)'s score is \(score)")
        
        test01()
        testAppendInt()
        testOverloads()
        testMultiple()
    }
    
    func test01() {
        
        let str1 = "a"
        let str2 = "b"
        let str3 = "c"
        let str4 = "d"
        print(str1 + str2 + str3 + str4)
        
    }
    
    func testAppendInt() {
        let temp = 5
        let temp2 = -5
        print("Today it's \(temp) but yesterday it was \(temp2)")
    }
    
    func testOverloads() {
        let names = ["Amy", "Clara", "Rose"]
        print("Companions: \(names)")
        print("Singed Companions: \(singed: names)")
    }
    
    func testMultiple() {
        print("the date is \(Date(), date: DateFormatter.Style.full)")
        print("the time is \(Date(), time: DateFormatter.Style.medium)")
        print("The date time long style is \(Date(), date: .long, time: .long)")
        print("The date time short style is \(Date(), date: .short, time: .short)")
    }
}
