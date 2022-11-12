import RealmSwift

class Server: Object, Decodable {
    @Persisted var online: Bool
    @Persisted var hostname: String?
    @Persisted var version: String?
    @Persisted var players: Players?
}
