//
// Copyright © 2021 Dmitry Rybakov. All rights reserved. 
    

import SwiftUI

struct TextCardView: View {
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)
                .frame(maxWidth: .infinity, maxHeight: 200)
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    Text("New features")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    HStack(alignment: .top) {
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 50)
                        Text("Outstanding features are available in our new release!")
                            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .topLeading)
                    }
                }
                .padding()
                .background {
                    Color.white
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                }
                .padding(.horizontal, 10)

                VStack(alignment: .leading, spacing: 0) {
                    Text("Critical updates")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    HStack(alignment: .top) {
                        Image("image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxHeight: 50)
                        HStackDynamicHeight(models: ["Outstanding", "features", "are", "available", "in", "our", "new", "release!", "Perfect", "awesome", "loud", "scream", "text"]) { text in
                            Text(text)
                        }
                    }
                }
                .padding()
                .background {
                    Color.white
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 10)
                }
                .padding(.horizontal, 10)
            }
        }
    }
}
