import Foundation

enum Destination: Hashable {
    case secondScreen(name: String)
    case dashboard(name: String)
}