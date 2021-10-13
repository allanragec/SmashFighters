//
//  HomeViewModel.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    struct Contants {
        static let All = "All"
    }
    
    @Published var universes: [Universe] = []
    @Published var fighters: [Fighter] = []
    @Published var isLoadingUniverses: Bool = false
    @Published var isLoadingFighters: Bool = false
    
    var filterItems: [String] {
        [Contants.All] + universes.map { $0.name }
    }
    
    @Published var selectedItem: String = Contants.All
    private var subscriptions = Set<AnyCancellable>()
    
    init() {
        UniverseRepository.getUniverses()
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveSubscription: { _ in
                self.isLoadingUniverses = true
            })
            .sink(receiveCompletion: { result in
                if case let .failure(error) = result {
                    self.showError(error)
                }
                
                self.isLoadingUniverses = false
            }, receiveValue: { result in
                self.universes = result
            })
            .store(in: &subscriptions)
        
        $selectedItem
            .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main)
            .handleEvents(receiveOutput: { _ in
                self.isLoadingFighters = true
            })
            .map { filter -> AnyPublisher<[Fighter], Error> in
                if filter == Contants.All {
                    return FighterRepository.getFighters()
                }
                
                return FighterRepository.searchFightersByUniverse(filter)
            }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { result in
                if case let .failure(error) = result {
                    self.showError(error)
                }
                self.isLoadingFighters = false
            }, receiveValue: { result in
                self.fighters = result
                self.isLoadingFighters = false
            })
            .store(in: &subscriptions)
        
    }
    
    private func showError(_ error: Error) {
        print("Error during the fetch data: \(error)")
    }
}
