//
// Copyright © 2021 Dmitry Rybakov. All rights reserved.
    

import SwiftUI

struct AnimatedButtonView: View {
    @State var isAnimated: Bool = false

    var body: some View {
        VStack {
            Button("Click") {
                withAnimation(
                    Animation
                        .default
                        .repeatCount(5, autoreverses: true)
                ) {
                    isAnimated.toggle()
                }
            }
            Spacer()
            RoundedRectangle(cornerRadius: isAnimated ? 50: 25)
                .fill(isAnimated ? .red: .green)
                .frame(
                    width: isAnimated ? 100: 250,
                    height: isAnimated ? 100: 250)
                .rotationEffect(Angle(degrees: isAnimated ? 360: 0))
                .offset(y: isAnimated ? 100: 0)
            Spacer()
        }
    }
}

struct AnimatedButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButtonView()
    }
}
