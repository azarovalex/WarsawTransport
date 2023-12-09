//
//  WarsawTransportApp.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

@main
struct WarsawTransportApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate
    @ObservedObject private var state = AppState()
    var body: some Scene {
        WindowGroup {
            ContentView(activeTab: $state.activeTab)
        }
    }
}

private class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        let config = UISceneConfiguration(name: nil, sessionRole: connectingSceneSession.role)
        config.delegateClass = SceneDelegate.self
        return config
    }
}

@Observable
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    private weak var windowScene: UIWindowScene?

    var tabWindow: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        windowScene = scene as? UIWindowScene
    }

    func addTabBar(_ activeTab: Binding<Tab>) {
        guard let windowScene else { return }

        let tabBarController = UIHostingController(
            rootView: CustomTabBar(activeTab: activeTab)
                .frame(maxHeight: .infinity, alignment: .bottom)
        )
        tabBarController.view.backgroundColor = .clear

        let tabWindow = PassThroughWindow(windowScene: windowScene)
        tabWindow.isHidden = false
        tabWindow.rootViewController = tabBarController

        self.tabWindow = tabWindow
    }
}


private class PassThroughWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let view = super.hitTest(point, with: event) else { return nil }
        return rootViewController?.view == view ? nil : view
    }
}
