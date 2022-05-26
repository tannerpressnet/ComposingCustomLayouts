/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A visual representation of the specified pet.
*/

import SwiftUI

/// A visual representation of the specified pet.
///
/// This view shows a colorful circle that contains the first letter of the
/// pet's type. If you prefer an image for the avatar, you can add images for
/// each pet type to the asset catalog using the pet's type name as the name
/// of the image. Then replace the `Circle` and its modifiers in the code below
/// with an `Image` view like this:
///
///     Image(pet.type)
///         .resizable()
///         .aspectRatio(contentMode: .fill)
///         .clipShape(Circle())
///         .shadow(radius: 7)
///         .frame(width: 100, height: 100)
///
struct Avatar: View {
    /// The pet to visualize.
    var pet: Pet

    var body: some View {
        Circle()
            .frame(width: 80, height: 80)
            .foregroundColor(pet.color)
            .shadow(radius: 3)
            .overlay {
                Text(pet.type.prefix(1).capitalized) // Use the first letter.
                    .font(.system(size: 64))
            }
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        HStack(spacing: 20) {
            ForEach(Model.previewData.pets) { pet in
                Avatar(pet: pet)
            }
        }
    }
}
