//
//  HomeContentView.swift
//  SmashFighters
//
//  Created by Allan Melo on 11/10/21.
//

import SwiftUI

struct HomeContentView: View {
    struct Contants {
        static var fighters = "Fighters"
    }
    
    @ObservedObject var viewModel = HomeViewModel()
    
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
                    HomeDivider(
                        title: Contants.fighters,
                        count: viewModel.fighters.count
                    )
                    
                    GridView(collection: viewModel.fighters) {
                        FighterItemView(fighter: $0)
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
