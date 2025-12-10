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
        DynamicIslandExpandedRegion(.center, priority: 1) {
          Text("Dynamic Island")
        }
        DynamicIslandExpandedRegion(.trailing, priority: 1) {
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

struct NotificationWidgetPreviews: PreviewProvider {
  static let attributes = NotificationAttributes(restaurant: "Burgão do Jão", order: "#0208")
  static let contentState = NotificationAttributes.ContentState(status: "Recebemos o seu pedido.", description: "Em até 30 minutos seu pedido sai para entrega", step: 1, stepMessage: "Boas notícias!", imageStep: "cooking")
  
  static var previews: some View {
    attributes
      .previewContext(contentState, viewKind: .content)
      .previewDisplayName("Notification")
    attributes
      .previewContext(contentState,viewKind: .dynamicIsland(.expanded))
      .previewDevice("Inslaned Expanded")
    attributes
      .previewContext(contentState, viewKind: .dynamicIsland(.compact))
      .previewDevice("Island Compact")
    attributes
      .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
      .previewDevice("Island Minimal")
  }
}
