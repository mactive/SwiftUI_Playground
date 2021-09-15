//
//  Stepper1.swift
//  swiftUI102
//
//  Created by bytedance on 2021/9/14.
//  Copyright © 2021 Qian Meng. All rights reserved.
//

import SwiftUI

struct Stepper1: View {
    @State private var stepperValue = 18
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
            Stepper(value: $stepperValue, in: 12...20) {
                Text("Age \(stepperValue)")
            }
            .font(.title)
            .background(Color.yellow)
            .padding()
            
            Stepper("Age", value: $stepperValue)
                // 隐藏label
                .labelsHidden()
                .background(Color.blue)
                .cornerRadius(10)
            }

    }
}

struct Stepper1_Previews: PreviewProvider {
    static var previews: some View {
        Stepper1()
    }
}
