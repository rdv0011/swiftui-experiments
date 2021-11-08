//
//  PullupSignup.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-08.
//

import SwiftUI

struct MySignUpView: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack(spacing: 20) {
                Image(systemName: "chevron.up")
                    .padding(.top)
                Text("Sign Up")
                    .font(.headline)
                    .fontWeight(.semibold)
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                Text("This is the description for our app. This is my favourite SwiftUI example and I recomment it to all my friends")
                    .multilineTextAlignment(.center)
                Text("CREATE ACCOUNT")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black.cornerRadius(10))
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(30)
        }
    }
}

struct PullupSignup: View {
    @State var startingOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentDragOffsetY: CGFloat = 0
    @State var endingOffsetY: CGFloat = 0

    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            MySignUpView()
                .offset(y: startingOffsetY)
                .offset(y: currentDragOffsetY)
                .offset(y: endingOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            withAnimation(.spring()) {
                                onChangedUpdateOffset(height: value.translation.height)
                            }
                        }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                onEndedUpdateOffset()
                            }
                        }
                )
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func onChangedUpdateOffset(height: CGFloat) {
        currentDragOffsetY = height
    }
    
    private func onEndedUpdateOffset() {
        if currentDragOffsetY < -150 {
            endingOffsetY = -startingOffsetY
        } else if endingOffsetY != 0 && currentDragOffsetY > 150 {
            endingOffsetY = 0
        }
        currentDragOffsetY = 0
    }
}

struct PullupSignup_Previews: PreviewProvider {
    static var previews: some View {
        PullupSignup()
.previewInterfaceOrientation(.portrait)
    }
}
