//
//  ImageView.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import SwiftUI
import Combine

struct ImageView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            }
            else {
                LoadingView()
            }
        }.aspectRatio(contentMode: .fit)
    }
}
