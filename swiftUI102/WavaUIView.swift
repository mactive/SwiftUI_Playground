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
    
    // 偏移量
    var phase: Double

    var animatableData: Double {
        get {phase}
        set {self.phase = newValue}
    }
    // 平滑采样率
    var smoothness: Double = 2.0
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath()
        
        let width = Double(rect.width)
        let height = Double(rect.height)
        let midWidth = width / 2
        let midHeight = height / 2
        let oneOverMidWidth = 1 / midWidth
        
        let wavelength = width / frequency
        
        path.move(to: CGPoint(x: 0, y: midHeight))
        
        
        for x in stride(from: 0, through: width, by: smoothness) {
            let relativeX = x / wavelength // x 轴的相对位置
            
            let distanceFromMidWidth  = x - midWidth
            let normalDistance = oneOverMidWidth * distanceFromMidWidth
            let parabola = -(normalDistance * normalDistance) + 1
            
            let sine = sin(relativeX + phase) // 已知一边, 求另一个边长 三角函数
            let y = parabola * strength * sine + midHeight
            path.addLine(to: CGPoint(x: x, y: y))
//            print("x:\(x) y:\(y-midHeight)")
        }
        
        return Path(path.cgPath)
    }
}


struct WavaUIView: View {
    @State private var phase = 0.0
    var body: some View {
        ZStack {
            ForEach(0..<10) { i in
                Wave(strength: 50, frequency: 10, phase: self.phase )
                    .stroke(Color.white.opacity(Double(i) / 10), lineWidth: 5)
                    .offset(y: CGFloat(i) * 12)
            }
        }
        .background(Color.blue)
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)) {
                self.phase = .pi * 2
            }
        }
    }
}

struct WavaUIView_Previews: PreviewProvider {
    static var previews: some View {
        WavaUIView()
    }
}
