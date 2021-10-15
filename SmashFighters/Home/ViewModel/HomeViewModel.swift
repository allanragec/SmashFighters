//
//  HomeViewModel.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var universes: [Universe] = []
    @Published var fighters: [Fighter] = []
    @Published var filteredFighters: [Fighter]?
    @Published var isLoadingUniverses: Bool = false
    @Published var isLoadingFighters: Bool = false
    @Published var selectedItem: String = Constants.All
    
    var filterItems: [String] {
        [Constants.All] + universes.map { $0.name }
    }
    
    private var subscriptions = Set<AnyCancellable>()
    var filteredValues: FilteredValues?
    
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
                self.universes = UniverseRepository.loadUniversesFromPersistence()
                
                self.isLoadingUniverses = false
            }, receiveValue: { result in
                UniverseRepository.saveUniverses(result)
                self.universes = result
            })
            .store(in: &subscriptions)
        
        $selectedItem
            .debounce(for: .milliseconds(200), scheduler: DispatchQueue.main)
            .handleEvents(receiveOutput: { _ in
                self.isLoadingFighters = true
            })
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map { self.fetchFighters($0) }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink { result in
                self.updateFighters(result)
                self.isLoadingFighters = false
            }
            .store(in: &subscriptions)
    }
    
    func getFightersLoader(_ filter: String) -> AnyPublisher<[Fighter], Error> {
        if filter == Constants.All {
            return FighterRepository.getFighters()
        }
        
        return FighterRepository.searchFightersByUniverse(filter)
    }
    
    func fetchFighters(_ filter: String) -> AnyPublisher<[Fighter], Never> {
        getFightersLoader(filter)
            .handleEvents(receiveOutput: { result in
                if filter == Constants.All {
                    FighterRepository.saveFighters(result)
                }
            })
            .catch { _ in
                Just(FighterRepository.loadFightersFromPersistence())
            }
            .eraseToAnyPublisher()
    }
    
    func pullToRefresh() async {
        do {
            let fighters = try await FighterRepository.getFightersAsync()
            DispatchQueue.main.async {
                self.updateFighters(fighters)
            }
        }
        catch let error {
            showError(error)
        }
    }

    func updateFighters(_ fighters: [Fighter]) {
        self.fighters = fighters
            .filter {
                (self.selectedItem == Constants.All) || ($0.universe.contains(self.selectedItem))
            }
        
        if let filter = filteredValues {
            filteredFighters = self.fighters
                .filter(
                    rate: filter.stars,
                    sortOption: filter.sortOption,
                    minimumPrice: filter.priceSlider.lowHandle.currentValue,
                    maximumPrice: filter.priceSlider.highHandle.currentValue
                )
        }
    }
    
    func clearFilters() {
        self.filteredFighters = nil
        self.filteredValues = nil
    }
    
    func updateFilter(_ filter: FilteredValues) {
        self.filteredValues = filter
        updateFighters(fighters)
    }
    
    private func showError(_ error: Error) {
        print("Error during the fetch data: \(error)")
    }
}
