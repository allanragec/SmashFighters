//
//  StarItem.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct StarItem: View {
    enum Size {
        case small
        case large
        
        var size: CGSize {
            switch self {
            case.large:
                return CGSize(width: 30.12, height: 29)
            case .small:
                return CGSize(width: 16.45, height: 15.84)
            }
        }
    }
    let isSelected: Bool
    let size: Size
    
    let selectedColor: Color
    let unselectedColor: Color
    
    var body: some View {
        Image("star")
            .resizable()
            .frame(width: size.size.width, height: size.size.height)
            .foregroundColor(isSelected ? selectedColor : unselectedColor)
    }
}

struct StarItem_Previews: PreviewProvider {
    static var previews: some View {
        StarItem(isSelected: true, size: .large, selectedColor: Color(hex: 0xFFCD00), unselectedColor: Color(hex: 0xB6B6B6))
    }
}
