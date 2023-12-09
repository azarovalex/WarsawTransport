//
//  TransportArrivalInfo.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import Foundation

struct TransportArrivalInfo: Identifiable {
    let id = UUID()
    let transportType: TransportType
    let lineNumber: Int
    let arrivingIn: TimeInterval
    let distance: Measurement<UnitLength>
}

extension TransportArrivalInfo {
    static let busMocks: [Self] = [
        .init(transportType: .bus, lineNumber: 4, arrivingIn: 594, distance: .init(value: 302, unit: .meters)),
        .init(transportType: .bus, lineNumber: 12, arrivingIn: 210, distance: .init(value: 105, unit: .meters)),
        .init(transportType: .bus, lineNumber: 22, arrivingIn: 756, distance: .init(value: 421, unit: .meters)),
        .init(transportType: .bus, lineNumber: 7, arrivingIn: 420, distance: .init(value: 189, unit: .meters)),
        .init(transportType: .bus, lineNumber: 15, arrivingIn: 312, distance: .init(value: 153, unit: .meters))
    ]

    static let tramMocks: [Self] = [
        .init(transportType: .tram, lineNumber: 1, arrivingIn: 240, distance: .init(value: 1200, unit: .meters)),
        .init(transportType: .tram, lineNumber: 3, arrivingIn: 180, distance: .init(value: 900, unit: .meters)),
        .init(transportType: .tram, lineNumber: 5, arrivingIn: 300, distance: .init(value: 1500, unit: .meters)),
        .init(transportType: .tram, lineNumber: 7, arrivingIn: 120, distance: .init(value: 600, unit: .meters)),
        .init(transportType: .tram, lineNumber: 9, arrivingIn: 360, distance: .init(value: 1800, unit: .meters))
    ]
}
