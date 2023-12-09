//
//  ContentView.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(SceneDelegate.self) private var sceneDelegate

    @Binding var activeTab: Tab

    var body: some View {
        MapView()
        .bottomSheet {
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
