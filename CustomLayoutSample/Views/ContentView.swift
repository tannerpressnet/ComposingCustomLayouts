/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The main content view for the app.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            Profile()
            Spacer()
            Leaderboard()
            Spacer()
            ButtonStack()
                .padding(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(Model.previewData)
    }
}
