import SwiftUI
import RealmSwift

struct ServerRow: View {
    @State private var serverFormIsPresented = false
    @ObservedRealmObject var server: StoredServer
    
    var body: some View {
        HStack {
            Button(action: openUpdateServer) {
                VStack(alignment: .leading) {
                    Text(server.getIp())
                        .font(.headline)
                    Text(server.getPlayerCount())
                        .font(.subheadline)
                }
                .lineLimit(1)
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $serverFormIsPresented) {
                ServerFormView(server: server)
            }
        }
    }
}

// MARK: - Actions
extension ServerRow {
    func openUpdateServer() {
        serverFormIsPresented.toggle()
    }
}

// MARK: - Preview
struct ServerRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ServerRow(server: StoredServerMocks.javaServer)
            ServerRow(server: StoredServerMocks.bedrockServer)
        }
        .previewLayout(.sizeThatFits)
    }
}
