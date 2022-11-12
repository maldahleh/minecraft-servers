enum StoredServerMocks {
    static var javaServer: StoredServer {
        let loadedServer = StoredServer()
        loadedServer.ip = "127.0.0.1"
        loadedServer.serverType = .java
        return loadedServer
    }
    
    static var bedrockServer: StoredServer {
        let loadedServer = StoredServer()
        loadedServer.ip = "127.0.0.1"
        loadedServer.serverType = .bedrock
        return loadedServer
    }
}
