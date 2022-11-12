import RealmSwift

class StoredServer {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var ip = ""
    @Persisted var serverType = ServerType.java
}
