//
//  CoreDataManager.swift
//  SmashFighters
//
//  Created by Allan Melo on 14/10/21.
//

import CoreData

class CoreDataManager {
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
    
                fatalError("Error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
}
