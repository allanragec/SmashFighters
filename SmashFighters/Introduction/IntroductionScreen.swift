//
//  IntroductionScreen.swift
//  SmashFighters
//
//  Created by Allan Melo on 11/10/21.
//

import SwiftUI

struct IntroductionScreen: View {
    enum Step {
        case first
        case second
        case third
        case home
    }
    
    @State var currentStep: Step = .first
    
    var body: some View {
        switch currentStep {
        case .first:
            IntroductionView(
                image: "first_screen_intro_image",
                title: "Access our Extended Catalog",
                buttonTitle: "Next",
                nextAction: {
                    self.currentStep = .second
                }
            )
        case .second:
            IntroductionView(
                image: "second_screen_intro_image",
                title: "Filter Universes",
                buttonTitle: "Next",
                nextAction: {
                    self.currentStep = .third
                }
            )
        case .third:
            IntroductionView(
                image: "third_screen_intro_image",
                title: "And More...",
                buttonTitle: "Get Stared",
                nextAction: {
                    UserDefaults.hasSeenAppIntroduction = true
                    self.currentStep = .home
                }
            )
        case .home:
            HomeContentView()
        }
    }
}

struct FirstScreenIntroduction_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionScreen()
    }
}
