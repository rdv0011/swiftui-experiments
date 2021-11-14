//
//  TabBarItemsPreferenceKey.swift
//  swiftui-experiments
//
//  Created by Dmytro Rybakov on 2021-11-14.
//

import Foundation
import SwiftUI

struct TabBarItemsPreferencesKey: PreferenceKey {
    static var defaultValue = [TabBarItem]()
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}
