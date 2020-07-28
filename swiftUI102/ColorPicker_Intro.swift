//
//  SwiftUIView.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/25.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import SwiftUI

struct ColorPicker_Intro: View {
    @State private var color = Color.blue
    var body: some View {
        VStack(spacing: 20) {
            Text("ColorPicker")
                .font(.title)
                .background(color)
            
            Spacer()
        
            
            ColorPicker("Pick a color", selection: $color)
                .padding(.horizontal)
            Spacer()

        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPicker_Intro()
    }
}
