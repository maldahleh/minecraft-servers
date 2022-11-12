enum StoredServerMocks {
    private static var loadedData: Server {
        let players = Players()
        players.online = 50
        players.max = 100

        let server = Server()
        server.online = true
        server.hostname = "mc.maldahleh.com"
        server.version = "1.18"
        server.players = players
        return server
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
