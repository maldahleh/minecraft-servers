import Alamofire

struct ServerStatusAPI {
    private static let JAVA_URL = "https://api.mcsrvstat.us/2/"
    private static let BEDROCK_URL = "https://api.mcsrvstat.us/bedrock/2/"
    
    func fetchServerStatsFor(_ storedServer: StoredServer, completion: @escaping (Server?) -> Void) {
        let requestUrl = buildRequestUrlFor(storedServer)
        AF.request(requestUrl).responseDecodable(of: Server.self) { (response) in
            guard let server = response.value else {
                completion(nil)
                return
            }

            completion(server)
        }
    }

    private func buildRequestUrlFor(_ storedServer: StoredServer) -> String {
        switch storedServer.serverType {
        case .java: return ServerStatusAPI.JAVA_URL + storedServer.ip
        case .bedrock: return ServerStatusAPI.BEDROCK_URL + storedServer.ip
        }
    }
}
