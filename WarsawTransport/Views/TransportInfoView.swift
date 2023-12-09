//
//  TransportInfoView.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

struct TransportArrivalView: View {
    let info: TransportArrivalInfo

    var body: some View {
        Button {} label: {
            HStack(spacing: 12) {
                Image(systemName: info.transportType.iconName)
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(12)
                    .background(.background, in: .circle)

                VStack(alignment: .leading, spacing: 4) {
                    Text("Line \(info.lineNumber)")
                        .fontWeight(.bold)

                    let formattedArrivalInterval = Duration.seconds(info.arrivingIn)
                        .formatted(.units(allowed: [.minutes, .hours], width: .wide))
                    Text("Arriving in " + formattedArrivalInterval)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Text(info.distance.formatted(.measurement(width: .wide, usage: .asProvided)))
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}
