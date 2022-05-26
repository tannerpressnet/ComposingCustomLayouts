/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model that holds the pet data.
*/

import SwiftUI

/// Storage for pet data.
///
/// This simple model keeps an array of pet instances, each of which tracks
/// its own vote count. It also provides information about the collection,
/// like the total vote count and the rank of a specified pet.
/// To extend this app, you might share this model data in iCloud among a
/// group of your app's users.
class Model: ObservableObject {

    /// The pets that people can vote for.
    ///
    /// The model supports any number of pets, but parts of the app's user
    /// interface, especially the `Profile` view, work only for exactly three
    /// pets.
    @Published var pets: [Pet]

    /// Creates a new model object with the given set of pets.
    init(pets: [Pet]) {
        self.pets = pets
    }

    /// The sum of all votes across all pets.
    var totalVotes: Int { pets.reduce(0) { $0 + $1.votes } }

    /// A Boolean value that indicates whether all the pets have the same
    /// number of votes.
    var isAllWayTie: Bool {
        pets.allSatisfy { $0.votes == pets.first?.votes }
    }

    /// Calculates the rank of an individual pet.
    ///
    /// Because this method calculates the rank as the number of pets that have
    /// more votes than the specified pet, pets with the same number of votes
    /// have the same rank, resulting in a tie.
    func rank(_ pet: Pet) -> Int {
        pets.reduce(1) { $0 + (($1.votes > pet.votes) ? 1 : 0) }
    }
}

extension Model {
    /// A set of data to use for running the app, starting with zero votes for
    /// each contender.
    static var startData: Model = Model(pets: [
        Pet(type: "Cat", color: .orange),
        Pet(type: "Goldfish", color: .yellow),
        Pet(type: "Dog", color: .brown)
    ])

    /// A set of example data to use for previews.
    ///
    /// This preview data assigns each pet the number of votes that matches its
    /// index to ensure that the preview looks the same all the time.
    /// If you prefer random data, use something like `Int.random(in: 0...100)`
    /// instead.
    static var previewData: Model {
        let model = startData
        for index in model.pets.indices {
            model.pets[index].votes = index
        }
        return model
    }
}
