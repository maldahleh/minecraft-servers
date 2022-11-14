import ActivityKit
import Foundation
import RealmSwift

class StoredServer: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var ip = ""
    @Persisted var serverType = ServerType.java
    @Persisted var serverData: Server?
    
    var activity: Activity<ServerAttributes>?
}

// MARK: - Live Activities
extension StoredServer {
    func start() {
        let attributes = ServerAttributes(ip: getIp())
        let state = ServerAttributes.ContentState(online: getOnline(), max: getMax())
        
        do {
            activity = try Activity.request(attributes: attributes, contentState: state)
        } catch {
            // TODO: Error
        }
    }
    
    func isActive() -> Bool {
        return activity?.activityState == .active
    }
    
    func cancel() {
        Task {
            await activity?.end(using: nil, dismissalPolicy: .immediate)
        }
    }
}

// MARK: - Getters
extension StoredServer {
    func getIp() -> String {
        guard let serverData = serverData, let hostname = serverData.hostname else {
            return ip
        }
        
        return hostname
    }
    
    func getOnline() -> String {
        guard let serverData = serverData, let players = serverData.players else {
            return "Loading..."
        }
        
        return formatNumber(players.online)
    }
    
    func getMax() -> String {
        guard let serverData = serverData, let players = serverData.players else {
            return "Loading..."
        }
        
        return formatNumber(players.max)
    }
    
    func getPlayerCount() -> String {
        guard let serverData = serverData, let players = serverData.players else {
            return "Loading..."
        }
        
        return "\(formatNumber(players.online))/\(formatNumber(players.max))"
    }
    
    func getVersion() -> String {
        guard let serverData = serverData, let version = serverData.version else {
            return "Loading..."
        }
        
        return version
    }
}

// MARK: - Utilities
extension StoredServer {
    private func formatNumber(_ value: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        
        let formattedNumber = numberFormatter.string(from: NSNumber(value: value))
        guard let formattedNumber = formattedNumber else {
            return "\(value)"
        }
        
        return formattedNumber
    }
}
