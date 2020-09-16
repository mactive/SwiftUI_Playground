//
//  ContentView.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/21.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import SwiftUI
class User:ObservableObject {
    @Published var name = "twosome"
    func changeName(_ theName: String) {
        self.name = theName
    }
}

struct ContentView: View {
    @State private var clickToggle: Bool = false
    @ObservedObject var user = User()
    
    var body: some View {
        VStack{
            Text("Hello, World!").font(.largeTitle).foregroundColor(.blue)
            HStack {
                Text(user.name)
                Text(user.name)
                Text(user.name)
            }
//            WaveUIView()
//            PieChartView()
            BarChartView()
            
            Button(action: {
                self.user.changeName("TT")
            }) {
                Text("change").foregroundColor(.red)
            }
            
        }
        .font(.title)
        .foregroundColor(.green)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
