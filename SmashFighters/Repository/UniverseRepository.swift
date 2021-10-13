//
//  UniverseRepository.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation
import Combine

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
}
