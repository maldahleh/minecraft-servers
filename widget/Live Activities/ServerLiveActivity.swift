import ActivityKit
import WidgetKit
import SwiftUI

struct ServerLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: ServerAttributes.self) { context in
            VStack(alignment: .leading) {
                Text(context.attributes.ip)
                    .font(.headline)
                Text(context.state.playerCount)
                    .font(.subheadline)
            }
            .lineLimit(1)
            .padding()
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text(context.state.online)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.max)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text(context.attributes.ip)
                }
            } compactLeading: {
                Text(context.state.online)
            } compactTrailing: {
                Text(context.state.max)
            } minimal: {
                Text(context.state.online)
            }
            .keylineTint(Color.red)
        }
    }
}
