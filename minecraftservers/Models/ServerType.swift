import RealmSwift

enum ServerType: String, CaseIterable, PersistableEnum {
    case java, bedrock
}

// MARK: - Properties
extension ServerType {
    var title: String {
        switch self {
        case .java:
            return "Java"
        case .bedrock:
            return "Bedrock"
        }
    }
}
