//
//  BottomSheetContent.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

struct BottomSheetContent: View {
    let activeTab: Tab
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Divider()
                switch activeTab {
                case .bus:
                    TimetableView(transportType: .bus)
                case .tram:
                    TimetableView(transportType: .tram)
                case .settings:
                    SettingsView()
                }
            }
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading) {
                    Text(activeTab.title)
                        .font(.title3.bold())
                }
            })
        }
    }
}
