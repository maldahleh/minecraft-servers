import Foundation
import ActivityKit

struct ServerAttributes: ActivityAttributes {
    public typealias ServerStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var min: Int
        var max: Int
    }

    var ip: String
}
