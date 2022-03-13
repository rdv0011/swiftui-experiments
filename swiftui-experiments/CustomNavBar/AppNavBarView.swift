//
//  AppNavBarView.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-16.
//

import SwiftUI

struct AppNavBarView: View {
    var body: some View {
        CustomNavView {
            ZStack {
                Color.orange.ignoresSafeArea()
                CustomNavLink(
                    destination:
                        Text("Destination")
                        .customNavigationTitle("Second title")
                        .customNavigationSubtitle("Second subtitle")
                ) {
                        Text("Navigation link")
                    }
            }
            .customNavBarItems(title: "New title", subtitle: "Subttle!", backButtonHidden: true)
        }
    }
}

extension AppNavBarView {
    fileprivate var defaultNavView: some View {
        NavigationView {
            ZStack {
                Color.orange.ignoresSafeArea()
                NavigationLink(
                    destination:
                        Text("Destination")
                        .navigationTitle("Title")
                        .navigationBarBackButtonHidden(false)
                    ,
                    label: {
                        Text("Navigation link")
                    })
            }
            .navigationTitle("Nav title")
        }
    }
}

struct AppNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        AppNavBarView()
    }
}
