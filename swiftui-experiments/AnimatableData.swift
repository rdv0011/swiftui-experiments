//
//  AnimatableData.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-10.
//

import SwiftUI

struct AnimatableData: View {
    @State var animated: Bool
    var body: some View {
        ZStack {
            Pacman(angleOffset: animated ? 20: 0)
                .frame(width: 250, height: 250)
        }
        .onAppear {
            withAnimation(.easeInOut.repeatForever()) {
                animated.toggle()
            }
        }
    }
}

struct AnimatableData_Previews: PreviewProvider {
    static var previews: some View {
        AnimatableData(animated: true)
    }
}

struct Pacman: Shape {
    var angleOffset: Double
    var animatableData: Double {
        get {
            angleOffset
        }
        set {
            angleOffset = newValue
        }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                        radius: rect.height / 2,
                        startAngle: Angle(degrees: angleOffset),
                        endAngle: Angle(degrees: 360 - angleOffset),
                        clockwise: false)
        }
    }
}
