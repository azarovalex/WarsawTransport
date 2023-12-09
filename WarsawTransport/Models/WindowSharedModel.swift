//
//  WindowSharedModel.swift
//  WarsawTransport
//
//  Created by Alex Azarov on 12/9/23.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var activeTab = Tab.bus
}
