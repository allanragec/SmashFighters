//
//  FighterItemView.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import SwiftUI

struct FighterItemView: View {
    let fighter: Fighter
    
    var body: some View {
        VStack {
            Group {
                ImageView(withURL: fighter.imageURL)
                    .padding(9)
            }
                .frame(width: 142, height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(hex: 0xEAEAEA), lineWidth: 1)
                )
                .background(Color(hex: 0xFBFBFB))
            Text(fighter.name.uppercased())
                .font(.custom("HelveticaNeue-Bold", size: 10))
            Text(fighter.universe.uppercased())
                .font(.custom("HelveticaNeue-Regular", size: 10))
        }
    }
}


struct FighterItemView_Previews: PreviewProvider {
    static var previews: some View {
        FighterItemView(
            fighter:
                Fighter(
                    objectID: "",
                    name: "Donkey Kong",
                    universe: "Donkey Kong",
                    price: "",
                    popular: true,
                    downloads: "",
                    description: "",
                    createdAt: "",
                    imageURL: "https://myapp.koombea.com/smash/9.png"
                )
        )
    }
}
