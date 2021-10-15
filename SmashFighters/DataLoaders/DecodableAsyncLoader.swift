//
//  DecodableAsyncLoader.swift
//  SmashFighters
//
//  Created by Allan Melo on 14/10/21.
//

import Foundation

struct DecodableAsyncLoader<T: Decodable> {
    var urlSession = URLSession.shared
    var url: URL
    
    var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()

    func load() async throws -> T {
        let (data, _) = try await urlSession.data(from: url)
        return try decoder.decode(T.self, from: data)
    }
}
