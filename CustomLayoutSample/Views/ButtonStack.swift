/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that shows buttons that people tap to vote for their favorite pet.
*/

import SwiftUI

/// A view that shows buttons that people tap to vote for their favorite pet,
/// arranged in a way that best fits available space.
/// - Tag: ButtonStack
struct ButtonStack: View {
    var body: some View {
        ViewThatFits { // Choose the first view that fits.
            MyEqualWidthHStack { // Arrange horizontally if it fits...
                Buttons()
            }
            MyEqualWidthVStack { // ...or vertically, otherwise.
                Buttons()
            }
        }
    }
}

/// A set of buttons that enable voting for the different pets.
///
/// This is just a list of buttons, and depends on its container view to do
/// the layout.
private struct Buttons: View {
    @EnvironmentObject private var model: Model

    var body: some View {
        ForEach($model.pets) { $pet in
            Button {
                pet.votes += 1
            } label: {
                Text(pet.type)
                    .frame(maxWidth: .infinity) // Expand to fill the offered space.
            }
            .buttonStyle(.bordered)
        }
    }
}

struct ButtonStack_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStack()
            .environmentObject(Model.previewData)
    }
}
