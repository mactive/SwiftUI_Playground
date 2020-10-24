//
//  LinkedListPractice.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/28.
//  Copyright © 2020 Qian Meng. All rights reserved.
//
// MARK: -- 计算那种数据结构更节省时间
import Foundation

// 累计计算量
let testBatchLimit = 200_000

struct WhoIsFast {
    init() {
        var start = CFAbsoluteTimeGetCurrent()
        var items = Array(1...testBatchLimit)
        while items.isEmpty == false {
            items.remove(at: 0)
        }
        var end = CFAbsoluteTimeGetCurrent()
        print("Took \(end-start) seconds to get clean")
        
        start = CFAbsoluteTimeGetCurrent()
        items = Array(1...testBatchLimit)
        while items.isEmpty == false {
            items.removeLast()
        }
        end = CFAbsoluteTimeGetCurrent()
        print("Took \(end-start) seconds to get clean")
    }
}
