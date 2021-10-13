//
//  RadioButton.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct RadioButton: View {
    @Environment(\.colorScheme) var colorScheme
    
    let id: String
    let callback: (String)->()
    let selectedID : String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    
    var isSelected: Bool {
        self.selectedID == self.id
    }
    
    init(
        _ id: String,
        callback: @escaping (String)->(),
        selectedID: String,
        size: CGFloat = 16.64,
        color: Color = Color.primary,
        textSize: CGFloat = 14
    ) {
        self.id = id
        self.size = size
        self.color = color
        self.textSize = textSize
        self.selectedID = selectedID
        self.callback = callback
    }
    
    var body: some View {
        Button(action:{
            self.callback(self.id)
        }) {
            HStack(alignment: .center) {
                Text(id)
                    .font(Font.system(size: textSize))
                Spacer()
                Image(isSelected ? "radio_selected" : "radio_deselected")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: self.size, height: self.size)
            }
            .padding(.bottom, 5)
            .foregroundColor(self.color)
        }
        .foregroundColor(self.color)
    }
}

struct RadioButton_Previews: PreviewProvider {
    static var previews: some View {
        RadioButton("A", callback: { _ in }, selectedID: "A")
    }
}
