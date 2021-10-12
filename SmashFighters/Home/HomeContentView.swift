//
//  HomeContentView.swift
//  SmashFighters
//
//  Created by Allan Melo on 11/10/21.
//

import SwiftUI

struct HomeContentView: View {
    var items = ["All", "Detail", "History", "Home"]
    @State var selectedItem: String = ""
    
    var body: some View {
        VStack {
            Text("Fighters")
                .font(.custom("HelveticaNeue-Regular", size: 24))
            TabBar(items: items, selectedItem: self.$selectedItem)
            Spacer()
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
