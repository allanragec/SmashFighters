//
//  StarsView.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct StarsView: View {
    @Binding var stars: Int
    
    let selectedColor: Color
    let unselectedColor: Color
    let size: StarItem.Size
    
    init(stars: Binding<Int>, selectedColor: Color = Color.white, unselectedColor: Color = Color.black.opacity(0.2), size: StarItem.Size = .small) {
        self._stars = stars
        self.selectedColor = selectedColor
        self.unselectedColor = unselectedColor
        self.size = size
    }
    
    var body: some View {
        HStack {
            StarItem(isSelected: stars >= 1, size: size, selectedColor: selectedColor, unselectedColor: unselectedColor)
                .onTapGesture {
                    self.stars = 1
                }
            StarItem(isSelected: stars >= 2, size: size, selectedColor: selectedColor, unselectedColor: unselectedColor)
                .onTapGesture {
                    self.stars = 2
                }
            StarItem(isSelected: stars >= 3, size: size, selectedColor: selectedColor, unselectedColor: unselectedColor)
                .onTapGesture {
                    self.stars = 3
                }
            StarItem(isSelected: stars >= 4, size: size, selectedColor: selectedColor, unselectedColor: unselectedColor)
                .onTapGesture {
                    self.stars = 4
                }
            StarItem(isSelected: stars >= 5, size: size, selectedColor: selectedColor, unselectedColor: unselectedColor)
                .onTapGesture {
                    self.stars = 5
                }
        }
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView(stars: Binding.constant(3))
    }
}
