//
//  FighterDetails.swift
//  SmashFighters
//
//  Created by Allan Melo on 13/10/21.
//

import SwiftUI

struct FighterDetails: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let fighter: Fighter
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "chevron.left")
                .resizable()
                .frame(width: 11.4, height: 20)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
    }
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        btnBack
                            .padding(.bottom, 9)
                        Text(fighter.name)
                            .foregroundColor(Color.white)
                            .font(.custom("HelveticaNeue-Bold", size: 30))
                            .frame(alignment: .leading)
                            .padding(.bottom, 9)
                        Text(fighter.universe)
                            .foregroundColor(Color.white.opacity(0.5))
                            .font(.custom("HelveticaNeue-Bold", size: 20))
                            .frame(alignment: .leading)
                    }
                    
                    Spacer()
                }
                .padding(.leading, 28)
                
                HStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("\(fighter.downloads) downloads")
                            .font(.custom("HelveticaNeue-Regular", size: 16))
                            .foregroundColor(Color.white)
                            .padding(.bottom, 7)
                        StarsView(stars: fighter.rate)
                            .padding(.bottom, 27)
                            .allowsHitTesting(false)
                        PriceView(title: "$\(fighter.price)")
                            .padding(.bottom, 76)
                    }
                    .frame(alignment: .topLeading)
                    Spacer()
                    ImageView(withURL: fighter.imageURL)
                        .frame(width: 218, height: 218)
                }
                .padding(.leading, 28)
            }
            .background(
                Image("bg_details")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
            )
            
            ScrollView {
                Text(fighter.description)
                    .font(.custom("HelveticaNeue-Regular", size: 14))
                    .foregroundColor(Color(hex: 0x343434))
                    .multilineTextAlignment(.leading)
                    .padding(28)
            }
            Spacer()
        }
        .navigationBarHidden(true)
    }
}

struct FighterDetails_Previews: PreviewProvider {
    static var previews: some View {
        FighterDetails(fighter:
                        Fighter(
                            objectID: "",
                            name: "Donkey Kong",
                            universe: "Donkey Kong",
                            price: "399",
                            popular: true,
                            rate: 2,
                            downloads: "10",
                            description: "Mario (マリオ, Mario) is a playable character in Super Smash Bros. Ultimate. He was suggested to appear in the then unnamed Ultimate in its first teaser trailer at the end of the March 8th, 2018 Nintendo Direct, and officially announced in Ultimate's E3 2018 trailer on June 12th, 2018 alongside the rest of the returning roster. Mario is classified as Fighter #01, the first fighter number of the SSB veterans and fighters as a whole. As in Smash 4, Charles Martinet's portrayal of Mario from Brawl was repurposed for Ultimate.",
                            createdAt: "",
                            imageURL: "https://myapp.koombea.com/smash/9.png"
                        )
        )
    }
}
