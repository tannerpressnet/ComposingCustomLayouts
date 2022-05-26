/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A representation of a single pet.
*/

import SwiftUI

struct Pet: Identifiable, Equatable {
    let type: String
    let color: Color
    var votes: Int = 0
    var id: String { type }
}
