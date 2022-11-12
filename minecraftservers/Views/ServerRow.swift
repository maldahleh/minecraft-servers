import SwiftUI
import RealmSwift

struct ServerRow: View {
    @State private var serverFormIsPresented = false
    @ObservedRealmObject var server: StoredServer
    
    var body: some View {
        HStack {
            Button(action: openUpdateServer) {
                Text(server.getIp())
                    .padding(.horizontal, 4)
                VStack(alignment: .leading) {
                    Text(server.getPlayerCount())
                        .font(.headline)
                    Text(server.getVersion())
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

struct ServerRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ServerRow(server: StoredServerMocks.javaServer)
            ServerRow(server: StoredServerMocks.bedrockServer)
        }
        .previewLayout(.sizeThatFits)
    }
}
