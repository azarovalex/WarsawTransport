//
//  TimetableView.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

struct TimetableView: View {
    let transportType: TransportType
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                ForEach(transportType == .bus ? TransportArrivalInfo.busMocks : TransportArrivalInfo.tramMocks) {
                    TransportArrivalView(info: $0)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
        .scrollIndicators(.hidden)
        .scrollContentBackground(.hidden)
    }
}

#Preview {
    TimetableView(transportType: .bus)
}
