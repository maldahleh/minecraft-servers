import Foundation
import ActivityKit

public struct ServerAttributes: ActivityAttributes {
    public typealias ServerStatus = ContentState

    public struct ContentState: Codable, Hashable {
        var online: String
        var max: String
    }

    var ip: String
}

extension ServerAttributes.ContentState {
    var playerCount: String {
        return "\(online)/\(max) Players"
    }
}
