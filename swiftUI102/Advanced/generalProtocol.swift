//
//  generalProtocol.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/8/12.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import Foundation
import UIKit

protocol NameDescribable {
    var typeName: String { get }
    static var typeName: String { get }
}

extension NameDescribable {
    var typeName: String {
        return String(describing: type(of: self))
    }

    static var typeName: String {
        return String(describing: self)
    }
}


// Extend with class/struct/enum...
extension NSObject: NameDescribable {}
extension Array: NameDescribable {}
extension UIBarStyle: NameDescribable { }


struct protocalTest {
    init() {
        print(UITabBarController().typeName)
        print(UINavigationController.typeName)
        print([Int]().typeName)
        print(UIBarStyle.typeName)

        // Out put:
//        UITabBarController
//        UINavigationController
//        Array<Int>
//        UIBarStyle
    }
}
