//
//  TabBarItem.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-14.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case home
    case favorites
    case profile
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorites:
            return "heart"
        case .profile:
            return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorites:
            return "Favorites"
        case .profile:
            return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return .red
        case .favorites:
            return .green
        case .profile:
            return .blue
        }
    }
}
