struct Server: Decodable {
    let online: Bool
    let hostname: String?
    let version: String?
    let players: Players?
}
