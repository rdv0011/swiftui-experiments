//
//  CustomTabBarView.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-14.
//

import SwiftUI

struct CustomTabBarView: View {
    let tabs: [TabBarItem]
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchTo(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
        
    }
}

struct CustomTabBarView_Previews: PreviewProvider {
    static let tabs:[TabBarItem] = [
        .home,
        .favorites,
        .profile
    ]

    static var previews: some View {
        CustomTabBarView(tabs: tabs, selection: .constant(tabs.first!))
    }
}

extension CustomTabBarView {
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(selection == tab ? tab.color : Color.gray)
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .background(
            ZStack {
                if selection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
        .cornerRadius(10)
    }
    
    private func switchTo(tab: TabBarItem) {
        withAnimation(.easeInOut) {
            selection = tab
        }
    }
}
