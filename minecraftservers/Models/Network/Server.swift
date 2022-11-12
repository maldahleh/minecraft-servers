struct Server: Decodable {
    let hostname: String
    let version: String
    let players: Players
}
