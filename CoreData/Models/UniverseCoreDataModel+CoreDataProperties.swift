//
//  UniverseCoreDataModel+CoreDataProperties.swift
//  SmashFighters
//
//  Created by Allan Melo on 14/10/21.
//
//

import Foundation
import CoreData

extension UniverseCoreDataModel {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<UniverseCoreDataModel> {
        return NSFetchRequest<UniverseCoreDataModel>(entityName: "UniverseCoreDataModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: String?
    @NSManaged public var desc: String?
}

extension UniverseCoreDataModel : Identifiable {
}
