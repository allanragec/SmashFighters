//
//  Fighter.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation

struct Fighter: Decodable, Hashable {
    let objectID: String
    let name: String
    let universe: String
    let price: String
    let popular: Bool
    let rate: Int
    let downloads: String
    let description: String
    let createdAt: String
    let imageURL: String
}
