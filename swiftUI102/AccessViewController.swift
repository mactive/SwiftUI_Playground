//
//  AccessViewController.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/23.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import UIKit


class AccessViewController: UIViewController{
    private var myClassVarA = 90
    override func viewDidLoad() {
        super.viewDidLoad()
        print("private variable:",myClassVarA)
    }
    override func viewDidLayoutSubviews() {
        //
    }
}
extension AccessViewController{
    func printValueOfA(){
        print("accessing private variable of same class in extension:", myClassVarA)
    }
}

