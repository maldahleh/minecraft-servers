import RealmSwift

enum ServerType: String, CaseIterable, PersistableEnum {
    case java, bedrock
}

// MARK: - Properties
extension ServerType: CustomStringConvertible {
    var description: String {
        return self.rawValue.capitalized
    }
}
