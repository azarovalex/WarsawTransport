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

    @State private var vehicles = [Vehicle]()
    @State private var errorMessage: String?

    var body: some View {
        Map(viewport: $viewport) {
            Puck2D(bearing: .heading)
                    .showsAccuracyRing(true)

            // TODO: Rewrite using PointAnnotationGroup for increased performance
            ForEvery(vehicles) { vehicle in
                MapViewAnnotation(coordinate: vehicle.position) {
                    Image(systemName: "bus")
                        .resizable()
                        .foregroundStyle(colorScheme == .light ? .white : .white)
                        .frame(width: 20, height: 20)
                        .padding(10)
                        .background(.blue.gradient, in: .circle)
                }
                .allowOverlap(true)
            }
        }
        .mapStyle(.standard(lightPreset: colorScheme == .light ? .day : .night))
        .ornamentOptions(.init(
            scaleBar: .init(visibility: .hidden),
            logo: .init(margins: Constants.ornamentMargins),
            attributionButton: .init(margins: Constants.ornamentMargins)))
        .ignoresSafeArea()
        .task {
            do {
                vehicles = try await TransportService().refreshBusPositions()
                print("Downloaded vehicles: \(vehicles)")
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        .alert("Error", isPresented: .constant(errorMessage != nil), presenting: errorMessage) { _ in
            Button("OK") {}
        } message: { errorMessage in
            Text(errorMessage)
        }
    }
}

#Preview {
    MapView()
}
