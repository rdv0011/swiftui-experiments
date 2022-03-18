//
//  FluidCardHome.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2022-03-13.
//

import Foundation
import SwiftUI

struct FluidCardHome: View {
    @State var expandCard: Bool = false
    var body: some View {
        VStack(spacing: 15) {
            Button {

            } label: {
                Image(systemName: "chevron.left")
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .overlay {
                Text("Remember Words")
                    .fontWeight(.semibold)
            }
            .foregroundColor(.black)

            // MARK: Animated Liquid Transition Cards
            LiquidCard(title: "Silicon", subtitle: "See you", detail: "An armchair",
                       description: "One silicon two silicons three silicons", color: .blue) {
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.8)) {
                    expandCard.toggle()
                }
            }
                .frame(maxHeight: .infinity)
        }
        .padding()
        .frame(maxHeight: .infinity, alignment: .top)
    }

    @ViewBuilder
    func LiquidCard(title: String, subtitle: String, detail: String, description: String,
                    color: Color = Color("Blue"), onExpand: @escaping ()->()) -> some View {
        ZStack {
            VStack(spacing: 20) {
                Text(title)
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                HStack(spacing: 10) {
                    Image(systemName: "speaker.wave.3")
                        .foregroundColor(.red)
                    Text(subtitle)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: expandCard ? 250: 350)
            .background {
                GeometryReader { proxy in
                    let size = proxy.size
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(color)
                }
            }
            // MARK: Expand Button
            .overlay(alignment: .bottom) {
                Button {
                    onExpand()
                } label: {
                    Image(systemName: "chevron.down")
                        .font(.title3.bold())
                        .foregroundColor(color)
                        .padding(30)
                        .background(.white, in: RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
                        .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
                }
                .padding(.bottom, -25)
            }
            .zIndex(1)

            // MARK: Expanded Card
            VStack(spacing: 20) {
                Text(detail)
                    .font(.largeTitle.bold())
                Text(description)
                    .font(.title3)
                    .lineLimit(3)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
            }
            .foregroundColor(.white)
            .padding(.vertical, 40)
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .background {
                GeometryReader { proxy in
                    let size = proxy.size
                    RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(color)
                }
            }
            .zIndex(0)
            .offset(y: expandCard ? 280: 0)
        }
        .offset(y: expandCard ? -120: 0)
    }
}

struct FluidCardHome_Preview: PreviewProvider {
    static var previews: some View {
        FluidCardHome()
    }
}
