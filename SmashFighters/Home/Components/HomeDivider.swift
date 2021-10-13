//
//  HomeDivider.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct HomeDivider: View {
    let title: String
    let count: Int
    
    var body: some View {
        HStack {
            Text("\(title) (\(count))")
                .font(.custom("HelveticaNeue-Bold", size: 18))
                .padding(.leading, 14)
            Spacer()
            VStack {
                Divider()
            }
            .frame(width: 185)
        }
    }
}

struct HomeDivider_Previews: PreviewProvider {
    static var previews: some View {
        HomeDivider(title: "ABC", count: 3)
    }
}
