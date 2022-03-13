//
//  CustomNavBarContainerView.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-16.
//

import SwiftUI

struct CustomNavBarContainerView<Content: View>: View {
    let content: Content
    @State private var showBackButton: Bool = false
    @State private var title: String = ""
    @State private var subtitle: String? = nil
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {
        VStack(spacing: 0) {
            CustomNavBarView(showBackButton: showBackButton, title: title, subtitle: subtitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(CustomNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(CustomNavBarSubtitlePreferenceKey.self) { value in
            self.subtitle = value
        }
        .onPreferenceChange(CustomNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
    }
}

struct CustomNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                Text("Hello world!")
                    .foregroundColor(.white)
                    .customNavigationTitle("Title")
                    .customNavigationSubtitle("Subtitle")
                    .customNavigationBackButtonHidden(true)
            }
        }
    }
}
