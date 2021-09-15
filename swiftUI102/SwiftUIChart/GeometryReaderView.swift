//
//  GeometryReader.swift
//  swiftUI102
//
//  Created by Qian Meng on 2021/8/1.
//  Copyright © 2021 Qian Meng. All rights reserved.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
            MyRectangle()
            HStack {
                Text("SwiftUI")
                    .foregroundColor(.black).font(.title).padding(15)
                    .background(RoundCorners(color: .green, tr: 30, bl: 30))
                Text("Lab")
                    .foregroundColor(.black).font(.title).padding(15)
                    .background(RoundCorners(color: .blue, tl: 30, br: 30))
            }
            .padding(20).shadow(radius: 3)
        }.frame(width: 250, height: 200).border(Color.black)
    }
}

struct MyRectangle: View {
    var body: some View {
        // 这就是个局部容器DIV
        GeometryReader { geometry in
            let x = geometry.size.width / 4.0
            let y = geometry.size.height / 4.0
            // 居中放置
            Rectangle()
                .path(in: CGRect(x: x,
                                y: y,
                                width: geometry.size.width / 2.0,
                                height: geometry.size.height / 2.0))
                .fill(Color.blue)
           
        }
    }
}

// 另一个例子
struct RoundCorners: View {
    var color: Color = .black
    var tl: CGFloat = 0.0 // top-left radius parameter
    var tr: CGFloat = 0.0 // top-right radius parameter
    var bl: CGFloat = 0.0 // bottom-left radius parameter
    var br: CGFloat = 0.0 // bottom-right radius parameter
    
    var body: some View {
        GeometryReader {  geometry in
            Path { path in
                            
                let w = geometry.size.width
                let h = geometry.size.height
                
                // We make sure the radius does not exceed the bounds dimensions
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w / 2.0, y: 0))
                path.addLine(to: CGPoint(x: w - tr, y: 0))
                path.addArc(center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h - br))
                path.addArc(center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                }
                .fill(self.color)
        }
    }
}

struct GeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
