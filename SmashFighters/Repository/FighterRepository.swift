//
//  FighterRepository.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation
import Combine

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
}
