//
//  HomeContentView.swift
//  SmashFighters
//
//  Created by Allan Melo on 11/10/21.
//

import SwiftUI

struct HomeContentView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State private var showingFilter = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .center) {
                    Spacer()
                    Text(viewModel.title)
                        .font(.custom("HelveticaNeue-Regular", size: 24))
                        .padding(.leading, 47)
                    
                    Spacer()
                    
                    Button(action: {
                        self.showingFilter.toggle()
                    }, label: {
                        Image("filter")
                            .frame(width: 21, height: 14)
                            .foregroundColor(viewModel.filterIconColor)
                    })
                        .sheet(isPresented: $showingFilter) {
                            FilterFighters(
                                filteredValues: viewModel.filteredValues,
                                didFilter: { viewModel.updateFilter($0) }) {
                                    viewModel.clearFilters()
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
                            title: viewModel.homeDividerTitle,
                            count: viewModel.fightersCount
                        )
                        
                        List {
                            GridView(collection: viewModel.fightersList) { fighter in
                                NavigationLink(destination: FighterDetails(fighter: fighter)) {
                                    FighterItemView(fighter: fighter)
                                }
                                .buttonStyle(.plain)
                            }
                        }
                        .listStyle(.grouped)
                        .onAppear(perform: {
                            UITableView.appearance().backgroundColor = UIColor.clear
                            UITableView.appearance().separatorColor = UIColor.clear
                        })
                        .refreshable {
                            await viewModel.pullToRefresh()
                        }
                        .padding(.top, -10)
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
