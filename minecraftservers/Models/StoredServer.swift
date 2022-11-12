import RealmSwift

class StoredServer: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var ip = ""
    @Persisted var serverType = ServerType.java
    var serverData: Server?

    func getIp() -> String {
        guard let serverData = serverData, let hostname = serverData.hostname else {
            return ip
        }
        
        return hostname
    }

    func getPlayerCount() -> String {
        guard let serverData = serverData, let players = serverData.players else {
            return "Loading..."
        }
        
        return "\(players.online)/\(players.max)"
    }

    func getVersion() -> String {
        guard let serverData = serverData, let version = serverData.version else {
            return "Loading..."
        }
        
        return version
    }
}
