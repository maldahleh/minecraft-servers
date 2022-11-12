import RealmSwift

class StoredServer: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var ip = ""
    @Persisted var serverType = ServerType.java
    var serverData: Server?

    func getIp() -> String {
        guard let serverData = serverData else {
            return ip
        }
        
        return serverData.hostname
    }

    func getPlayerCount() -> String {
        guard let serverData = serverData else {
            return "Loading..."
        }
        
        return "\(serverData.players.online)/\(serverData.players.max)"
    }

    func getVersion() -> String {
        guard let serverData = serverData else {
            return "Loading..."
        }
        
        return serverData.version
    }
}
