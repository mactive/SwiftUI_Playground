//
//  AccessControl.swift
//  swiftUI102
//
//  Created by Qian Meng on 2020/7/23.
//  Copyright © 2020 Qian Meng. All rights reserved.
//

import SwiftUI

struct RemoteImage: View {
    // 内部枚举
    private enum LoadState {
        case loading, success, failure
    }
    
    // 内部Class
    private class Loader: ObservableObject {
        // 这里没有使用 @Published 而是用手工触发
        var data = Data()
        var state = LoadState.loading // 默认loading
        
        init(url: String) {
            guard let parseURL = URL(string: url) else {
                fatalError("Invalid URL: \(url)")
            }
            
            URLSession.shared.dataTask(with: parseURL) { data, response, error in
                DispatchQueue.main.async {
                    if let data = data, data.count > 0 {
                        self.data = data
                        self.state = .success
                    } else {
                        self.state = .failure
                    }
                    
                    // 手工触发 ObservableObject 的改变
                    // inside our initializer to control view updates by hand.
                    self.objectWillChange.send()
                }
            }.resume()
        }
    }
    
    // MARK: -- struct 内部变量声明
    // Because Loader is a reference type, we need to use the @StateObject property wrapper to make sure SwiftUI keeps it alive the whole time.
    @StateObject private var loader: Loader
    var loadingImage: Image
    var failureImage: Image
    
    init(url: String,
         loading: Image = Image(systemName: "photo"),
         failure: Image = Image(systemName: "multiply.circle")) {
        // 通过StateObject 方法 获得 Loader class的实例
        _loader = StateObject(wrappedValue: Loader(url: url))
        
        // MARK: --  Loader instance
        /**
            All Swift’s property wrappers are just structs with the same name as the wrapper, so we can just create a StateObject instance and pass it whatever value we want to wrap.
            
            If you want to assign to a property wrapper in your code, as opposed to the property inside the wrapper, you should put an underscore in front of the property’s name.
        */
        
        
        self.loadingImage = loading
        self.failureImage = failure
    }
    
    private func selectImage() -> Image {
        switch loader.state {
        case .loading:
            return loadingImage
        case .failure:
            return failureImage
        default:
            if let image = UIImage(data: loader.data) {
                return Image(uiImage: image)
            } else {
                return failureImage
            }
        }
    }
    
    var body: some View {
        selectImage().resizable()
    }
}

struct RemoteImageView: View {
    var body: some View {
        RemoteImage(url: "https://www.hackingwithswift.com/img/app-store@2x.png")
            .aspectRatio(contentMode: .fit)
            .frame(width: 200)
    }
}

struct AccessControl_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
    }
}
