//
//  FighterRepository.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation
import Combine
import CoreData

class FighterRepository {
    struct Constants {
        static let url = "https://593cdf8fb56f410011e7e7a9.mockapi.io/fighters"
    }
    
    class func getFighters() -> AnyPublisher<[Fighter], Error> {
        guard let url = URL(string: Constants.url) else {
            return Empty().eraseToAnyPublisher()
        }
        
        return DecodableLoader<[Fighter]>(url: url).load()
    }
    
    class func searchFightersByUniverse(_ universe: String) -> AnyPublisher<[Fighter], Error> {
        guard let url = URL(string: "\(Constants.url)?universe=\(universe)".normalizedURL) else {
            return Empty().eraseToAnyPublisher()
        }
        
        return DecodableLoader<[Fighter]>(url: url).load()
    }
    
    class func saveFighters(_ fighters: [Fighter]) {
        let viewContext = CoreDataManager.shared.viewContext
        
        loadFightersFromPersistence().forEach { viewContext.delete($0) }
        
        fighters.forEach { fighter in
            let fighterCoreDataModel = FighterCoreDataModel(context: viewContext)
            fighterCoreDataModel.id = fighter.objectID
            fighterCoreDataModel.name = fighter.name
            fighterCoreDataModel.universe = fighter.universe
            fighterCoreDataModel.price = fighter.price
            fighterCoreDataModel.popular = fighter.popular
            fighterCoreDataModel.rate = Int16(fighter.rate)
            fighterCoreDataModel.downloads = fighter.downloads
            fighterCoreDataModel.desc = fighter.description
            fighterCoreDataModel.createdAt = fighter.createdAt
            fighterCoreDataModel.imageURL = fighter.imageURL
        }
        
        try? viewContext.save()
    }
    
    class func loadFightersFromPersistence() -> [FighterCoreDataModel] {
        let viewContext = CoreDataManager.shared.viewContext
        let fetchRequest = NSFetchRequest<FighterCoreDataModel>(entityName: "FighterCoreDataModel")
        return (try? viewContext.fetch(fetchRequest)) ?? []
    }
}
