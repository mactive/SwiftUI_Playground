//
//  WavaUIView.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/22.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import SwiftUI

struct Wave: Shape {
    // 波长
    var strength: Double
    
    // 频率
    var frequency: Double
    
    var phase: Double

    // 平滑采样率
    var smoothness: Double = 2.0
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        
        let wavelength = width / frequency
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        
        for x in stride(from: 0, through: width, by: smoothness) {
            let relativeX = x / wavelength // x 轴的相对位置
            let sine = sin(relativeX + phase) // 已知一边, 求另一个边长 三角函数
            let y = strength * sine + midHeight
            path.addLine(to: CGPoint(x: x, y: y))
            print("x:\(x) y:\(y-midHeight)")
        }
        
        return Path(path.cgPath)
    }
}


struct WavaUIView: View {
    var body: some View {
        ZStack {
            Wave(strength: 50, frequency: 30, phase: 10 )
                .stroke(Color.white, lineWidth: 5)
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
    }
}

struct WavaUIView_Previews: PreviewProvider {
    static var previews: some View {
        WavaUIView()
    }
}
