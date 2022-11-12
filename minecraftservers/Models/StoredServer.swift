import RealmSwift

class StoredServer: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var ip = ""
    @Persisted var serverType = ServerType.java
    var serverData: Server?
}
