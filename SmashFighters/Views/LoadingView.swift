//
//  LoadingView.swift
//  SmashFighters
//
//  Created by Allan Melo on 12/10/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            ProgressView()
                .frame(alignment: .center)
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
