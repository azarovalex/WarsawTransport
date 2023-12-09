//
//  MapView.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI
@_spi(Experimental) import MapboxMaps

struct MapView: View {
    enum Constants {
        static let warsawCenter = CLLocationCoordinate2D(latitude: 52.2280, longitude: 21.0055)
        static let ornamentMargins = CGPoint(x: 8, y: 118)
    }

    @Environment(\.colorScheme) private var colorScheme

    @State private var viewport = Viewport.camera(
        center: Constants.warsawCenter,
        zoom: 12
    )

    var body: some View {
        Map(viewport: $viewport)
            .mapStyle(.standard(lightPreset: colorScheme == .light ? .day : .dusk))
            .ornamentOptions(.init(
                scaleBar: .init(visibility: .hidden),
                logo: .init(margins: Constants.ornamentMargins),
                attributionButton: .init(margins: Constants.ornamentMargins)))
            .ignoresSafeArea()
    }
}

#Preview {
    MapView()
}
