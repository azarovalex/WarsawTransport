//
//  Tab.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import Foundation

enum Tab: Hashable, CaseIterable {
    case bus
    case tram
    case settings

    var title: String {
        switch self {
        case .bus:
            "Bus"
        case .tram:
            "Tram"
        case .settings:
            "Settings"
        }
    }

    var iconName: String {
        switch self {
        case .bus:
            "bus.doubledecker"
        case .tram:
            "tram"
        case .settings:
            "gear"
        }
    }
}
