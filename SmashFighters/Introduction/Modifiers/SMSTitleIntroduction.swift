import SwiftUI

struct SMSTitleIntroduction: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.white)
            .font(.custom("HelveticaNeue-Regular", size: 36))
            .multilineTextAlignment(.center)
    }
}
