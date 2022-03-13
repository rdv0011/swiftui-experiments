//
//  CustomNavView.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-16.
//

import SwiftUI

struct CustomNavView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            CustomNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct CustomNavView_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavView {
            CustomNavLink(destination: Text("Destination")) {
                ZStack{
                    Color.red.ignoresSafeArea()
                    Text("Click me")
                }
            }
        }
    }
}
