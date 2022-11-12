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
    
    @objc func updateServers() {
        let realm = try! Realm()
        for server in realm.objects(StoredServer.self) {
            serverStatusAPI.fetchServerStatsFor(server) { data in
                try! realm.write {
                    server.serverData = data
                }
            }
        }
    }
}
