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
    @Published var filteredFighters: [Fighter]?
    @Published var isLoadingUniverses: Bool = false
    @Published var isLoadingFighters: Bool = false
    @Published var selectedItem: String = Contants.All
    
    var filterItems: [String] {
        [Contants.All] + universes.map { $0.name }
    }
    
    var isFiltered: Bool {
        filteredFighters != nil
    }

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
                self.filteredFighters = nil
                self.isLoadingFighters = true
            })
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map { self.fetchFighters($0) }
            .switchToLatest()
            .receive(on: DispatchQueue.main)
            .sink { result in
                self.fighters = result
                self.isLoadingFighters = false
            }
            .store(in: &subscriptions)
    }
    
    func getFightersLoader() -> AnyPublisher<[Fighter], Error> {
        if selectedItem == Contants.All {
            return FighterRepository.getFighters()
        }
        
        return FighterRepository.searchFightersByUniverse(selectedItem)
    }
    
    func fetchFighters(_ filter: String) -> AnyPublisher<[Fighter], Never> {
        getFightersLoader()
            .handleEvents(receiveOutput: { result in
                if filter == Contants.All {
                    FighterRepository.saveFighters(result)
                }
            })
            .catch { _ in
                Just(
                    FighterRepository.loadFightersFromPersistence()
                        .filter {
                            (filter == Contants.All) || ($0.universe == filter)
                        }
                )
            }
            .eraseToAnyPublisher()
    }
    
    func filter(_ filter: FilteredValues) {
        filteredFighters = fighters.filter { fighter in
            let fighterPrice = Double(fighter.price) ?? 0
            return (fighter.rate == filter.stars) &&
            (fighterPrice >= filter.minimumPrice ) &&
            (fighterPrice <= filter.maximumPrice)
        }.sorted { fighter1, fighter2 in
            switch filter.sortOption {
            case .rate:
                return fighter1.rate > fighter2.rate
            case .ascending:
                return fighter1.name < fighter2.name
            case .descending:
                return fighter1.name > fighter2.name
            case .downloads:
                return fighter1.downloads > fighter1.downloads
            }
        }
    }
    
    private func showError(_ error: Error) {
        print("Error during the fetch data: \(error)")
    }
}
