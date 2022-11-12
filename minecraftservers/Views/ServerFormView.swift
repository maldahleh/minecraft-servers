import SwiftUI
import RealmSwift

struct ServerFormView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    
    @ObservedRealmObject var server: StoredServer
    
    var isUpdating: Bool {
        server.realm != nil
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("IP", text: $server.ip)
                Picker("Version", selection: $server.serverType) {
                    ForEach(ServerType.allCases, id: \.self) { serverType in
                        Text(serverType.title)
                    }
                }
            }
            .navigationTitle("Add a server")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(isUpdating ? "Done" : "Save") {
                        isUpdating ? dismiss() : save()
                    }
                    .disabled(server.ip.isEmpty)
                }
            }
        }
    }
}

// MARK: - Actions
extension ServerFormView {
    func save() {
        try? realm.write {
            realm.add(server)
        }
        
        dismiss()
    }
}

struct ServerFormView_Previews: PreviewProvider {
    static var previews: some View {
        ServerFormView(server: StoredServer())
    }
}
