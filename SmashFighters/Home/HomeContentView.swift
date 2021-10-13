//
//  HomeContentView.swift
//  SmashFighters
//
//  Created by Allan Melo on 11/10/21.
//

import SwiftUI

struct HomeContentView: View {
    @ObservedObject var viewModel = HomeViewModel()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Text("Fighters")
                .font(.custom("HelveticaNeue-Regular", size: 24))
            if viewModel.isLoadingUniverses {
                LoadingView()
            }
            else {
                TabBar(items: viewModel.filterItems, selectedItem: self.$viewModel.selectedItem)
                
                if viewModel.isLoadingFighters {
                    LoadingView()
                }
                else {
                    ScrollView {
                        LazyVGrid(columns: columns) {
                            ForEach(self.viewModel.fighters, id: \.self) { fighter in
                                FighterItemView(fighter: fighter)
                            }
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
