//
//  StarItem.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct StarItem: View {
    let isSelected: Bool
    
    let selectedColor = Color.white
    let unselectedColor = Color.black.opacity(0.2)
    
    var body: some View {
        Image("star")
            .frame(width: 16.45, height: 15.84)
            .foregroundColor(isSelected ? selectedColor : unselectedColor)
    }
}

struct StarItem_Previews: PreviewProvider {
    static var previews: some View {
        StarItem(isSelected: true)
    }
}
