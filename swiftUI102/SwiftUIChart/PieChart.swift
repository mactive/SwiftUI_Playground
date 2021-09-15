//
//  PieChart.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/9/9.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import SwiftUI

struct DataPoint: Identifiable {
    let id: Int
    let value: Double
    let color: Color
    
    init(value: Double, color: Color) {
        self.id = Int.random(in: 1..<Int.max)
        self.value = value
        self.color = color
    }
    
    init(id: Int, value: Double, color: Color) {
        self.id = id
        self.value = value
        self.color = color
    }
}

struct PieSegment: Shape, Identifiable {
    let data: DataPoint
    var id: Int { data.id }
    var startAngle: Double // 开始角度
    var amount: Double  // 张开角度
    // 增加动画效果
    var animatableData: AnimatablePair<Double, Double> {
        get { AnimatablePair(startAngle, amount) }
        set {
            startAngle = newValue.first
            amount = newValue.second
        }
    }
    
    func path(in rect: CGRect) -> Path {
        let radius = min(rect.width, rect.height) * 0.5
        let center = CGPoint(x: rect.width * 0.5, y: rect.height * 0.5)
        var path = Path()
        path.move(to: center)
        path.addRelativeArc(
            center: center,
            radius: radius,
            startAngle: Angle(radians: startAngle),
            delta: Angle(radians: amount)
        )
        return path
    }
}

struct PieChart: View {
    let pieSegments: [PieSegment]
    let strokeWidth: Double?
    
    @ViewBuilder var mask: some View {
        if let strokeWidth = strokeWidth {
            Circle().strokeBorder(Color.black, lineWidth: CGFloat(strokeWidth))
        } else {
            Circle()
        }
    }

    init(dataPoints:[DataPoint], strokeWidth: Double? = nil) {
        self.strokeWidth = strokeWidth
        var segments = [PieSegment]()
        // 所有data的总和
        var total = dataPoints.reduce(0) { $0 + $1.value}
        print("total: \(total)")
        // 起始点 3.1415 / 2
        var startAngle = -Double.pi / 2
        
        for data in dataPoints {
            // 没份的占比 data.value / total
            let amount = .pi * 2 * (data.value / total)
            print("amount: \(amount) startAngle: \(startAngle)")
            print("data: \(data)")
            let segment = PieSegment(data: data, startAngle: startAngle, amount: amount)
            segments.append(segment)
            startAngle += amount
        }
        pieSegments = segments
    }
    
    
    
    var body: some View {
        ZStack {
            ForEach(pieSegments) { segment in
                segment
                    .fill(segment.data.color)
            }
        }.mask(mask)
    }
}


struct PieChartView: View {
    @State private var redAmount = Double.random(in: 10...100)
    @State private var yellowAmount = Double.random(in: 10...100)
    @State private var greenAmount = Double.random(in: 10...100)
    @State private var blueAmount = Double.random(in: 10...100)


    var data: [DataPoint] {
        [
            DataPoint(id: 1, value: redAmount, color: .red),
            DataPoint(id: 2, value: yellowAmount, color: .yellow),
            DataPoint(id: 3, value: greenAmount, color: .green),
            DataPoint(id: 4, value: blueAmount, color: .blue)
        ]
    }
    


    var body: some View {
        VStack {
            // 50宽的圆环
            PieChart(dataPoints: data, strokeWidth: 50)
                .onTapGesture {
                    withAnimation {
                        redAmount = Double.random(in: 25...75)
                        yellowAmount = Double.random(in: 25...75)
                        greenAmount = Double.random(in: 25...75)
                        blueAmount = Double.random(in: 25...75)
                    }
                }
            // PieChart
            PieChart(dataPoints: data)
        }
        
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView()
    }
}
