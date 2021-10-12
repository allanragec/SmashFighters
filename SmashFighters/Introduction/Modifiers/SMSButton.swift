import SwiftUI

struct SMSButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("PingFangSC-Semibold", size: 20))
            .frame(width: 192, height: 54)
            .foregroundColor(Color.white)
            .background(Color(hex: 0xDB3069))
            .clipShape(Capsule())
    }
}
