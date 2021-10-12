import SwiftUI

struct TabBarItem: View {
    let title: String
    var currentItem: String
    var didTap: (String) -> Void
    
    var isSelected: Bool {
        title == currentItem
    }
    
    var titleColor: Color {
        isSelected ? Color.white : Color(hex: 0xDB3069)
    }
    
    var backgroundColor: Color {
        isSelected ? Color(hex: 0xDB3069) : Color.white
    }
    
    var body: some View {
        Text(title)
            .font(.custom("HelveticaNeue-Regular", size: 15))
            .frame(width: 125, height: 39)
            .foregroundColor(titleColor)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(hex: 0xDB3069), lineWidth: 1)
            )
            .padding(2)
            .onTapGesture {
                didTap(title)
            }
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBarItem(title: "Test", currentItem: "Test 1") { _ in }
            TabBarItem(title: "Test", currentItem: "Test") { _ in }
        }
    }
}
