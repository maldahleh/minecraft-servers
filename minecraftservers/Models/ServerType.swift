import RealmSwift

enum ServerType: String, CaseIterable, PersistableEnum {
    case java, bedrock
    
    var title: String {
        switch self {
        case .java: return "Java"
        case .bedrock: return "Bedrock"
        }
    }
}
