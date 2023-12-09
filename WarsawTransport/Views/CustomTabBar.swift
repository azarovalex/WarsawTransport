//
//  CustomTabBar.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

struct CustomTabBar: View {
    enum Constants {
        static let height: Double = 45
    }

    @Binding var activeTab: Tab
    @State var hack: Bool = false // TODO: refactor

    var body: some View {
        VStack {
            Divider()
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.hashValue) { tab in
                    Button {
                        activeTab = tab
                        hack.toggle()
                    } label: {
                        VStack {
                            Image(systemName: tab.iconName)
                                .font(.title2)

                            Text(tab.title)
                                .font(.caption)
                        }
                        .foregroundStyle(activeTab == tab ? Color.accentColor : .gray)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(.rect)
                    }
                }
                .id(hack)
            }
            .frame(height: Constants.height)
        }
        .background(.regularMaterial)
    }
}
