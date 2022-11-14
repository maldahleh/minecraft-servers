import WidgetKit
import SwiftUI

@main
struct widgetBundle: WidgetBundle {
    var body: some Widget {
        widget()
        
        if #available(iOS 16.1, *) {
            ServerLiveActivity()
        }
    }
}
