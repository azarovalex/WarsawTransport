//
//  SettingsView.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

// Just a mock for now, does nothing
struct SettingsView: View {
    @State private var notificationsEnabled = false
    @State private var distance = 5
    @State private var selectedTransportMode = 0
    let transportModes = ["Bus", "Tram", "Subway"]

    var body: some View {
        Form {
            Section(header: Text("Notifications")) {
                Toggle("Enable Notifications", isOn: $notificationsEnabled)
            }

            Section(header: Text("Distance")) {
                Stepper("Notify when within \(distance) km", value: $distance, in: 1...20)
            }

            Section(header: Text("Preferred Transport Mode")) {
                VStack {
                    Text("Lorem ipsum")
                    Picker(selection: $selectedTransportMode, label: Text("Transport Mode")) {
                        ForEach(0..<3) { index in
                            Text(self.transportModes[index]).tag(index)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
            }

            Section(header: Text("Other Settings")) {
                Button("Sign out", role: .destructive) {}
            }
        }
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    SettingsView()
}
