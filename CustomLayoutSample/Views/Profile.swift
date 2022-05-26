/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that shows how contenders rank relative to one another.
*/

import SwiftUI

/// A view that shows how contenders rank relative to one another.
///
/// This view assumes that the model contains exactly three pets. Any other
/// number results in undefined behavior.
/// - Tag: Profile
struct Profile: View {
    @EnvironmentObject private var model: Model

    var body: some View {
        // Use a horizontal layout for a tie; use a radial layout, otherwise.
        let layout = model.isAllWayTie ? AnyLayout(HStack()) : AnyLayout(MyRadialLayout())

        Podium()
            .overlay(alignment: .top) {
                layout {
                    ForEach(model.pets) { pet in
                        Avatar(pet: pet)
                            .rank(model.rank(pet))
                    }
                }
                .animation(.default, value: model.pets)
            }
    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
            .environmentObject(Model.previewData)
    }
}
