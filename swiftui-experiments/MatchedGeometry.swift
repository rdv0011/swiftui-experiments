//
//  MatchedGeometry.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-08.
//

import SwiftUI

struct MatchedGeometry: View {
    let categories = ["Home", "Popular", "Saved"]
    @State private var selected = ""
    @Namespace private var categoryBackgroundNamespace
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if selected == category {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red)
                            .matchedGeometryEffect(id: "categoryBackground", in: categoryBackgroundNamespace)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                    
                    Text(category)
                        .foregroundColor(selected == category ? .red : .black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selected = category
                    }
                }
            }
        }
    }
}

struct MatchedGeometry_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometry()
    }
}
