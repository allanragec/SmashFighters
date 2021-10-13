//
//  String.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import Foundation

extension String {
    var normalizedURL: String {
        addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? self
    }
}
