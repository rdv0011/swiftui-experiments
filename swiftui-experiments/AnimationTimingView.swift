//
// Copyright © 2019 Robert Bosch GmbH. All rights reserved. 
    

import SwiftUI

struct AnimationTimingView: View {
    @State var isAnimating: Bool = false
    let timing: Double = 3.0

    var body: some View {
        VStack {
            Button("Click") {
                isAnimating.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350: 50,  height: 100)
                .animation(Animation.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 1.0), value: isAnimating)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350: 50,  height: 100)
                .animation(Animation.linear(duration: timing), value: isAnimating)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350: 50,  height: 100)
                .animation(Animation.easeIn(duration: timing), value: isAnimating)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350: 50,  height: 100)
                .animation(Animation.easeInOut(duration: timing), value: isAnimating)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: isAnimating ? 350: 50,  height: 100)
                .animation(Animation.easeOut(duration: timing), value: isAnimating)
        }
    }
}

struct AnimationTimingView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationTimingView()
    }
}
