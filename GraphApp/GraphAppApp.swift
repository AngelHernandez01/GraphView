//
//  GraphAppApp.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/10/20.
//

import SwiftUI

@main
struct GraphAppApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(model: Model(isLandscape: UIDevice.current.orientation.isLandscape))
        }
    }
}
