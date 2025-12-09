import WidgetKit
import SwiftUI

@main
struct NotificationWidget: WidgetBundle {
  var body: some Widget {
    if #available(iOS 16.1, *) {
      NotificationWidgetView()
    }
  }
}

struct NotificationWidgetView: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: NotificationAttributes.self) { context in
      VStack() {
        Text("Principal Notification")
      }
    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading, priority: 1) {
          Text("Dynamic Island")
        }
      } compactLeading: {
        Text("L")
      } compactTrailing: {
        Text("R")
      } minimal: {
        Text("M")
      }
    }
  }
}
