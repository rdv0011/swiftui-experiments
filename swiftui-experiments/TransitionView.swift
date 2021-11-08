//
// Copyright © 2019 Robert Bosch GmbH. All rights reserved. 
    

import SwiftUI

struct TransitionView: View {
    @State var showView: Bool = false

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Button("Click") {
                    withAnimation(.spring(response: 1, dampingFraction: 0.7, blendDuration: 1)) {
                        showView.toggle()
                    }
                }
                Spacer()
                if showView {
                    RoundedRectangle(cornerRadius: 30)
                        .fill(.red)
                        .offset(y: 30)
                        .frame(maxWidth: .infinity, maxHeight: 300)
                        .transition(.move(edge: .bottom))
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct TransitionView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionView()
    }
}
