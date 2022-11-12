import RealmSwift

class Players: Object, Decodable {
    @Persisted var online: Int
    @Persisted var max: Int
}
