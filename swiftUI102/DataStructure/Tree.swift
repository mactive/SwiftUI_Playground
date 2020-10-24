//
//  Tree.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/10/24.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation

final class Node<Value> {
    var value: Value
    
    // 所有节点数量
    var count: Int {
        1 + children.reduce(0) { $0 + $1.count}
    }
    
    // private can make children read-only for external users,
    // while keeping it modifiable for methods inside Node:
    private(set) var children: [Node]
    
    init(_ value: Value) {
        self.value = value
        children = []
    }
    
    init(_ value: Value, children: [Node]) {
        self.value = value
        self.children = children
    }
    
    // 第三种构造方法
    init(_ value: Value, @NodeBuilder builder: () -> [Node]) {
        self.value = value
        self.children = builder()
    }
    
    func add(child: Node) {
        children.append(child)
    }
}

extension Node:Equatable where Value: Equatable {
    static func ==(lhs: Node, rhs: Node) -> Bool {
        lhs.value == rhs.value && lhs.children == rhs.children
    }
}

extension Node:Hashable where Value: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
        hasher.combine(children)
    }
}

extension Node:Codable where Value:Codable {
    
}

// 使用构造函数初始化
@_functionBuilder
struct NodeBuilder {
    static func buildBlock<Value>(_ children: Node<Value>...) -> [Node<Value>] {
        children
    }
}



class TreeSample {
    init() {
        var andrew = Node("Andrew")
        let john = Node("John")
        andrew.add(child: john)

        var paul = Node("Paul")
        var sophie = Node("Sophie")
        let sisi = Node("Sisi")
        let dodo = Node("Dodo")

        let charlotte = Node("Charlotte")
        
        paul.add(child: sophie)
        paul.add(child: charlotte)

        sophie.add(child: sisi)
        sophie.add(child: dodo)
        print(paul)
        print(paul.count)
        
        let terry = Node("Terry") {
            Node("Pual") {
                Node("Sphoie") {
                    Node("Sisi")
                    Node("Dodo")
                }
                Node("Charlotte")
            }
        }
        print("Terry: \(terry.count)")
    }
}



