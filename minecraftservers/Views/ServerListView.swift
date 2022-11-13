import SwiftUI
import RealmSwift

struct ServerListView: View {
    @State private var serverFormPresented = false
    @ObservedResults(StoredServer.self) var servers
    
    @ViewBuilder var addServerButton: some View {
        Button(action: addServer) {
            Label("Add Server", systemImage: "plus.circle.fill")
        }
        .foregroundColor(.green)
        .sheet(isPresented: $serverFormPresented) {
            ServerFormView(server: StoredServer())
        }
    }
    
    var body: some View {
        List {
            Section("Servers") {
                if servers.isEmpty {
                    Text("Add a server")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                ForEach(servers) { server in
                    ServerRow(server: server)
                }
                addServerButton
            }
        }
        .navigationTitle("Servers")
    }
}

// MARK: - Actions
extension ServerListView {
    func addServer() {
        serverFormPresented.toggle()
    }
}

// MARK: - Preview
struct ServerListView_Previews: PreviewProvider {
    static var previews: some View {
        ServerListView()
    }
}
