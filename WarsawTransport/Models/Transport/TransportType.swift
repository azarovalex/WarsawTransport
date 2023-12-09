//
//  TransportType.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import Foundation

enum TransportType {
    case bus
    case tram

    var iconName: String {
        switch self {
        case .bus:
            "bus"
        case .tram:
            "tram"
        }
    }
}
