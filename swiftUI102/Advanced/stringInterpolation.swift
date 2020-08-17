//
//  stringInterpolation.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/17.
//  Copyright © 2020 Qian Meng. All rights reserved.

// https://www.hackingwithswift.com/plus/advanced-swift/advanced-string-interpolation-part-one
//

import Foundation

enum PolatonArrayAction: CustomStringConvertible {
    case elements
    case sum
    case average
    
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .elements: return ".elements"
        case .sum: return ".sum"
        case .average: return ".average"
        }
    }
}


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
    
    // 参数支持闭包 或者 字符串
    mutating func appendInterpolation(
        _ function: @autoclosure () -> CustomStringConvertible,
        count: Int,
        separator: String = ", "
    ) {
        let result = (0..<count).map{ _ in function().description }
        appendLiteral(result.joined(separator: separator))
    }
    
    // Working with Codable
    mutating func appendInterpolation<T: Encodable>(_ value: T) {
        let encoder = JSONEncoder()
        if let result = try? encoder.encode(value) {
            let str = String(decoding: result, as: UTF8.self)
            appendLiteral("Codable: ")
            appendLiteral(str)
        }
    }
    
    // Challenges
    mutating func appendInterpolation(_ value: URL) {
        let htmlString = value.path
        appendLiteral(htmlString)
    }
    
    // enum
    mutating func appendInterpolation(_ values: [Int], action: PolatonArrayAction = .elements ) {
        var result: String
        switch action {
            case .elements:
                let resultStr = values.map{ String($0) }
                result = resultStr.joined(separator: " - ")
            case .sum:
                let sum = values.reduce(0, +)
                result = String(sum)
            case .average:
                let avarage = values.reduce(0, +) / values.count
                result = String(avarage)
        }
        appendLiteral("ArrayEnum: " + action.description + " " + result)
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
        testPowerfeature()
        testEncodable()
        testURL()
        testArrayEnum()
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
    
    func testPowerfeature() {
        print("Haters gonna \("hate", count: 5, separator: " !!! ")")
        print("Random numbers \(Int.random(in: 1...50), count: 8)")
    }
    
    func testEncodable() {
        let user1 = UserStringClass()
        print("Class dump: \(user1)")
        
        
        let user2 = UserStringStruct()
        print("Struct dump: \(user2)")
    }
    
    func testURL() {
        let url = URL.init(string: "http://www.google.com/dadfeore")
        print("URL: \(url)")
    }
    
    func testArrayEnum() {
        let arr = [1, 2,3,4,5]
        print("\(arr, action: .elements)")
        print("\(arr, action: .sum)")
        print("\(arr, action: .average)")
    }
}


class UserStringClass: Encodable {
    let name = "Taylor Swift"
    let age = 26
    let emailAddress = "taylor@swift.com"
}

struct UserStringStruct: Encodable {
    let name = "Taylor Swift"
    let age = 26
    let emailAddress = "taylor@swift.com"
}


