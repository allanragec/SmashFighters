//
//  StarsView.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct StarsView: View {
    let stars: Int
    
    var body: some View {
        HStack {
            StarItem(isSelected: stars >= 1)
            StarItem(isSelected: stars >= 2)
            StarItem(isSelected: stars >= 3)
            StarItem(isSelected: stars >= 4)
            StarItem(isSelected: stars >= 5)
        }
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(stars: 3)
    }
}
