import SwiftUI

struct IntroductionBackgroundStyle: ViewModifier {
    func body(content: Content) -> some View {
        LinearGradient(gradient: Gradient(colors: [Color(hex: 0xE55249), Color(hex: 0x2A52BE)]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.vertical)
            .overlay(
                content
            )
    }
}
