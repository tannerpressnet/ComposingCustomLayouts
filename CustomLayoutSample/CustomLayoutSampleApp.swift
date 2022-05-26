/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The app definition.
*/

import SwiftUI

@main
struct CustomLayoutSampleApp: App {
    // Initialize a data model with zero votes for everyone.
    @StateObject private var model: Model = Model.startData

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
        }
    }
}
