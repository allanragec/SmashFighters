//
//  FighterCoreDataModel+CoreDataProperties.swift
//  SmashFighters
//
//  Created by Allan Melo on 14/10/21.
//
//

import Foundation
import CoreData


extension FighterCoreDataModel {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<FighterCoreDataModel> {
        return NSFetchRequest<FighterCoreDataModel>(entityName: "FighterCoreDataModel")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var universe: String?
    @NSManaged public var price: String?
    @NSManaged public var popular: Bool
    @NSManaged public var rate: Int16
    @NSManaged public var downloads: String?
    @NSManaged public var desc: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var imageURL: String?
}

extension FighterCoreDataModel : Identifiable {
}
