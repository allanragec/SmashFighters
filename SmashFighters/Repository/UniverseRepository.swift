//
//  UniverseRepository.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation
import Combine
import CoreData

class UniverseRepository {
    struct Constants {
        static let url = "https://593cdf8fb56f410011e7e7a9.mockapi.io/universes"
    }
    
    class func getUniverses() -> AnyPublisher<[Universe], Error> {
        guard let url = URL(string: Constants.url) else {
            return Empty().eraseToAnyPublisher()
        }
        
        return DecodableLoader<[Universe]>(url: url).load()
    }
    
    class func saveUniverses(_ universes: [Universe]) {
        let viewContext = CoreDataManager().viewContext
        loadUniversesFromCoreData(viewContext).forEach { viewContext.delete($0) }
        
        universes.forEach { universe in
            let universeCoreDataModel = UniverseCoreDataModel(context: viewContext)
            universeCoreDataModel.id = universe.objectID
            universeCoreDataModel.name = universe.name
            universeCoreDataModel.desc = universe.description
        }
        
        try? viewContext.save()
    }
    
    class func loadUniversesFromPersistence() -> [Universe] {
        let viewContext = CoreDataManager().viewContext
        
        return loadUniversesFromCoreData(viewContext).toModels()
    }
    
    private class func loadUniversesFromCoreData(_ viewContext: NSManagedObjectContext) -> [UniverseCoreDataModel] {
        let fetchRequest = NSFetchRequest<UniverseCoreDataModel>(entityName: "UniverseCoreDataModel")
        return (try? viewContext.fetch(fetchRequest)) ?? []
    }
}
