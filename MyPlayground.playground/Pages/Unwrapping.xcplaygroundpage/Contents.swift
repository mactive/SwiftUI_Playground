//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

var name: String? = nil

// 手动打开或关闭, 输出会有不同
name = "mac meng"

if let unwrapped = name {
    print("\(unwrapped.count) letters")
} else {
    print("Missing name.")
}

print("continues.")

let result = greet(name)
print(result)

func greet(_ name: String?) -> String {
    guard let guardUnwrapped = name else {
        print("guard let don't provide a name")
        return "none name"
    }
    
    // 如果 没有值
    print("continues.")
    return name ?? "sth"
}



