//
//  TabBar.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import SwiftUI

struct TabBar: View {
    var items: [String]
    @Binding var selectedItem: String
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer(minLength: 21)
                ForEach(items, id: \.self) {
                    TabBarItem(title: $0, currentItem: self.selectedItem) {
                        self.selectedItem = $0
                    }
                }
                Spacer(minLength: 21)
            }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(items: ["Detail", "History", "Home"], selectedItem: Binding.constant("Home"))
    }
}
