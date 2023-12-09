//
//  ContentView.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @Binding var activeTab: Tab
    @Environment(SceneDelegate.self) private var sceneDelegate

    var body: some View {
        Map()
        .tabSheet {
            BottomSheetContent(activeTab: activeTab)
        }
        .onAppear {
            guard sceneDelegate.tabWindow == nil else { return }
            sceneDelegate.addTabBar($activeTab)
        }
    }
}

#Preview {
    ContentView(activeTab: .constant(.bus))
}
