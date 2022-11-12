enum StoredServerMocks {
    private static var loadedData: Server {
        let players = Players(online: 50, max: 100)
        return Server(hostname: "mc.maldahleh.com", version: "1.18", players: players)
    }

    static var javaServer: StoredServer {
        let loadedServer = StoredServer()
        loadedServer.ip = "127.0.0.1"
        loadedServer.serverType = .java
        loadedServer.serverData = loadedData
        return loadedServer
    }
    
    static var bedrockServer: StoredServer {
        let loadedServer = StoredServer()
        loadedServer.ip = "127.0.0.1"
        loadedServer.serverType = .bedrock
        return loadedServer
    }
}
