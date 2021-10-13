//
//  GridView.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import SwiftUI

struct GridView<Model: Hashable, ContentItem>: View where ContentItem: View {
    let collection: [Model]
    var content: (Model) -> ContentItem
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init(collection: [Model], content: @escaping (Model) -> ContentItem) {
        self.collection = collection
        self.content = content
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(self.collection, id: \.self) { item in
                    content(item)
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static let fighters = [
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
        ),
        Fighter(
            objectID: "",
            name: "Donkey Kong 2",
            universe: "Donkey Kong 2",
            price: "",
            popular: true,
            downloads: "",
            description: "",
            createdAt: "",
            imageURL: "https://myapp.koombea.com/smash/9.png"
        )
    ]
    
    static var previews: some View {
        GridView(collection: fighters) {
            FighterItemView(fighter: $0)
        }
    }
}
