//
//  BarChart.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/9/17.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import SwiftUI

struct BarDataPoint: Identifiable {
    let id: Int
    let value: Double
    let color: Color
    let title: String
    init(value: Double, color: Color, title: String) {
        self.id = Int.random(in: 1..<Int.max)
        self.value = value
        self.color = color
        self.title = title
    }
    
    init(id: Int, value: Double, color: Color, title: String) {
        self.id = id
        self.value = value
        self.color = color
        self.title = title
    }
}



struct BarChart: View {
    let dataPoints: [BarDataPoint]
    let maxValue: Double
    
    init(dataPoints: [BarDataPoint]) {
        self.dataPoints = dataPoints
        let highestPoint = dataPoints.max{ $0.value < $1.value }
        maxValue = highestPoint?.value ?? 1
    }
    
    var body: some View {
        ZStack{
            VStack {
                ForEach(1...10, id: \.self) { _ in
                    Divider()
                    Spacer()
                }
            }
            HStack{
                // 左侧刻度
                VStack {
                    ForEach((1...10).reversed(), id: \.self) { i in
                        Text(String(Int(maxValue / 10 * Double(i))))
                            .padding(.horizontal)
                            .animation(nil)
                            .font(.subheadline)
                        Spacer()
                    }
                }
                ForEach(dataPoints) { data in
                    VStack {
                        Rectangle()
                            .fill(data.color)
                            .scaleEffect(x: 1, y: CGFloat(data.value / maxValue), anchor: .bottom)

                        Text(data.title)
                            .font(.subheadline)
                            .bold()
                    }
                }
            }
        }
        
    }
}


struct BarChartView: View {
    @State private var redAmount = Double.random(in: 10...100)
    @State private var yellowAmount = Double.random(in: 10...100)
    @State private var greenAmount = Double.random(in: 10...100)
    @State private var blueAmount = Double.random(in: 10...100)


    var data: [BarDataPoint] {
        [
            BarDataPoint(id: 1, value: redAmount, color: .red, title: "Mayb"),
            BarDataPoint(id: 2, value: yellowAmount, color: .yellow, title: "Yes"),
            BarDataPoint(id: 3, value: greenAmount, color: .green, title: "NO"),
            BarDataPoint(id: 4, value: blueAmount, color: .blue, title: "N/A"),
            BarDataPoint(id: 5, value: greenAmount, color: .green, title: "No1"),
            BarDataPoint(id: 6, value: yellowAmount, color: .yellow, title: "No2"),
            BarDataPoint(id: 7, value: blueAmount, color: .blue, title: "No3")
        ]
    }
    


    var body: some View {
        VStack {
            // 50宽的圆环
            BarChart(dataPoints: data)
                .onTapGesture {
                    withAnimation {
                        redAmount = Double.random(in: 25...75)
                        yellowAmount = Double.random(in: 25...75)
                        greenAmount = Double.random(in: 25...75)
                        blueAmount = Double.random(in: 25...75)
                    }
                }
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView()
    }
}
