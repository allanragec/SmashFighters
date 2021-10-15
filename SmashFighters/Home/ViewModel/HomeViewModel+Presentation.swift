//
//  HomeViewModel+Presentation.swift
//  SmashFighters
//
//  Created by Allan Melo on 15/10/21.
//

import Foundation
import SwiftUI

extension HomeViewModel {
    struct Constants {
        static let All = "All"
        static var fighters = "Fighters"
        static var filtered = "Filtered"
    }
    
    var isFiltered: Bool {
        filteredFighters != nil
    }
    
    var filterIconColor: Color {
        isFiltered ? Color.branding : Color.black
    }
    
    var title: String {
        Constants.fighters
    }
    
    var homeDividerTitle: String {
        isFiltered ? Constants.filtered : Constants.fighters
    }
    
    var fightersCount: Int {
        filteredFighters?.count ?? fighters.count
    }
    
    var fightersList: [Fighter] {
        filteredFighters ?? fighters
    }
}
