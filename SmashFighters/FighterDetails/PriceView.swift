//
//  PriceView.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct PriceView: View {
    let title: String
    
    var titleColor: Color {
        Color.branding
    }
    
    var backgroundColor: Color {
        Color.white
    }
    
    var body: some View {
        Text(title)
            .font(.custom("HelveticaNeue-Bold", size: 22))
            .multilineTextAlignment(.center)
            .frame(width: 84, height: 40)
            .foregroundColor(titleColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(title: "$399")
    }
}
