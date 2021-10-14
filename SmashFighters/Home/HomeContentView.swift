//
//  HomeContentView.swift
//  SmashFighters
//
//  Created by Allan Melo on 11/10/21.
//

import SwiftUI

struct HomeContentView: View {
    struct Constants {
        static var fighters = "Fighters"
        static var filteres = "Filtered"
    }
    
    @ObservedObject var viewModel = HomeViewModel()
    @State private var showingFilter = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Text(Constants.fighters)
                        .font(.custom("HelveticaNeue-Regular", size: 24))
                        .padding(.leading, 47)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showingFilter.toggle()
                    }, label: {
                        Image("filter")
                            .frame(width: 21, height: 14)
                            .foregroundColor(viewModel.isFiltered ? Color.branding: Color.black)
                    })
                        .sheet(isPresented: $showingFilter) {
                            FilterFighters() { filter in
                                viewModel.filter(filter)
                            }
                        }
                }
                .padding(.trailing, 26)
                
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
                            title: viewModel.isFiltered ? Constants.filteres : Constants.fighters,
                            count: viewModel.filteredFighters?.count ?? viewModel.fighters.count
                        )
                        
                        GridView(collection: viewModel.filteredFighters ?? viewModel.fighters) { fighter in
                            NavigationLink(destination: FighterDetails(fighter: fighter)) {
                                FighterItemView(fighter: fighter)
                            }
                            .buttonStyle(.plain)
                        }
                    }
                }
                Spacer()
            }
            .navigationBarHidden(true)
        }
    }
}

struct HomeContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContentView()
    }
}
