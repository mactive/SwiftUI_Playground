//
//  TabView1.swift
//  swiftUI102
//
//  Created by bytedance on 2021/9/14.
//  Copyright © 2021 Qian Meng. All rights reserved.
//

import SwiftUI

struct TabView1: View {
    // selectionTab with tabItem tag
    @State private var selectionTab = 1
    
    
    var body: some View {
        TabView(selection: $selectionTab) {
            PageView1()
                .tabItem {
                    Text("Tab Label 1")
                    Image(systemName: "flame")
                }.tag(1)
            PageView2()
                .tabItem {
                    Text("Tab Label 2")
                    Image(systemName: "flame.fill")
                }.tag(2)
        }
        // custom tab item color default blue
        .accentColor(.red)
    }
}

struct TabView1_Previews: PreviewProvider {
    static var previews: some View {
        TabView1()
    }
}


struct PageView1: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            Text("Tab Content 1")
        }
    }
}

struct PageView2: View {
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            Text("Tab Content 2")
        }
    }
}
