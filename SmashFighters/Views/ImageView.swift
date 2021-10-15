//
//  ImageView.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ImageView: View {
    private let url: URL?
    
    @State var isAnimating: Bool = true
    
    init(withURL url: String) {
        self.url = URL(string: url)
    }
    
    var body: some View {
        Group {
            WebImage(url: self.url, isAnimating: $isAnimating) // Animation Control, supports dynamic changes
               .customLoopCount(1)
               .playbackRate(2.0)
               .playbackMode(.bounce)
               .resizable()
        }.aspectRatio(contentMode: .fit)
    }
}
