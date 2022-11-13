import Realm
import RealmSwift

class DataUpdater {
    let serverStatusAPI = ServerStatusAPI()
    var timer: Timer?
    
    func setupTimer() {
        updateServers()
        timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(updateServers), userInfo: nil, repeats: true)
    }
    
    func terminateTimer() {
        timer?.invalidate()
    }
    
    @objc private func updateServers() {
        let realm = try! Realm()
        for server in realm.objects(StoredServer.self) {
            DispatchQueue.main.async {
                self.serverStatusAPI.fetchServerStatsFor(server) { data in
                    realm.writeAsync {
                        server.serverData = data
                    }
                }
            }
        }
    }
}
