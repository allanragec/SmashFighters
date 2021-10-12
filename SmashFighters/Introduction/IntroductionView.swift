import SwiftUI

struct IntroductionView: View {
    let image: String
    let title: String
    let buttonTitle: String
    var nextAction: () -> Void = {}
    
    var body: some View {
        VStack {
            Spacer()
            
            Image(image)
                .resizable()
                .scaledToFit()
                .padding(13)
            
            Text(title)
                .modifier(SMSTitleIntroduction())
                .padding(.bottom, 69)
            
            Button(buttonTitle) {
                nextAction()
            }
            .modifier(SMSButton())
            .padding(.bottom, 100)
        }
        .modifier(IntroductionBackgroundStyle())
    }
}

struct IntroductionView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionView(
            image: "first_screen_intro_image",
            title: "Access our Extended Catalog",
            buttonTitle: "Next",
            nextAction: {}
        )
    }
}
