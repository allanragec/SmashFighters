//
//  SmashFightersApp.swift
//  SmashFighters
//
//  Created by Allan Melo on 11/10/21.
//

import SwiftUI

@main
struct SmashFightersApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.hasSeenAppIntroduction {
                HomeContentView()
            }
            else {
                IntroductionScreen()
            }
        }
    }
}
