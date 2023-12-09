//
//  TransportService.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import Foundation
import CoreLocation

struct Vehicle: Identifiable {
    let id = UUID()
    let position: CLLocationCoordinate2D
    let vehicleNumber: Int
    let line: String
    let lastUpdate: Date

    fileprivate init(vehicleDTO: ServerResponse.VehicleDTO) {
        self.position = CLLocationCoordinate2D(latitude: vehicleDTO.Lat, longitude: vehicleDTO.Lon)
        self.vehicleNumber = Int(vehicleDTO.VehicleNumber)!
        self.line = vehicleDTO.Lines
        self.lastUpdate = vehicleDTO.Time
    }
}

private struct ServerResponse: Decodable {
    struct VehicleDTO: Decodable {
        let Lines: String
        let Lon: Double
        let Lat: Double
        let Time: Date
        let VehicleNumber: String
    }

    let result: [VehicleDTO]
}

final class TransportService {
    private enum Constants {
        static let resourceId = "f2e5503e927d-4ad3-9500-4ab9e55deb59"
        static let busVehicleId = "1"
        static let locationEndpoint = "https://api.um.warszawa.pl/api/action/busestrams_get/"
        static let apiKeyInfoPlistKey = "ZTMAPIKey"
    }

    private lazy var jsonDecoder: JSONDecoder = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return jsonDecoder
    }()

    private lazy var apiKey: String = Bundle.main.infoDictionary!["ZTMAPIKey"] as! String

    func refreshBusPositions() async throws -> [Vehicle] {
        var urlComponents = URLComponents(string: Constants.locationEndpoint)
        urlComponents?.queryItems = [
            .init(name: "resource_id", value: Constants.resourceId),
            .init(name: "type", value: Constants.busVehicleId),
            .init(name: "apikey", value: apiKey),
        ]
        let url = urlComponents!.url!

        let (data, _) = try await URLSession.shared.data(from: url)
        let serverResponse = try jsonDecoder.decode(ServerResponse.self, from: data)

        return serverResponse.result.map(Vehicle.init)
    }
}
