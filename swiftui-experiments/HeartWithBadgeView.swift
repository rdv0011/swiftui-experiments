//
// Copyright © 2021 Dmitry Rybakov. All rights reserved. 
    

import SwiftUI

struct HeartWithBadgeView : View {
    let shadowColor = Color(#colorLiteral(red: 0, green: 0.09211900085, blue: 0.9428878427, alpha: 0.4921901273))
    let gradientColors = [Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)),Color(#colorLiteral(red: 0.2887184024, green: 0.1027120426, blue: 0.7445674539, alpha: 1))]
    @Binding var badgeText: String

    var body: some View {
        Image(systemName: "heart.fill")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .background {
                Circle()
                    .fill(LinearGradient(colors: gradientColors,
                                         startPoint: .topLeading,
                                         endPoint: .bottomTrailing)
                    )
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(color: shadowColor,
                            radius: 10,
                            x: 0,
                            y: 10)
                    .overlay(
                        Circle()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.blue)
                            .overlay(Text(badgeText)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    )
                            .shadow(color: shadowColor, radius: 10, x: 5, y: 5)
                        , alignment: .bottomTrailing
                    )
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HeartWithBadgeView(badgeText: .constant("2"))
    }
}
