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

func hexStringToUiColor (hex: String) -> UIColor {
  var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
  
  if(hexString.hasPrefix("#")) {
    hexString.remove(at: hexString.startIndex)
  }
  
  if((hexString.count) != 6){
    return UIColor.gray
  }
  
  var rgbValue: UInt64 = 0
  
  Scanner(string: hexString).scanHexInt64(&rgbValue)
  
  return UIColor(
    red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
    green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
    blue: CGFloat((rgbValue & 0x0000FF)) / 255.0,
    alpha: CGFloat(1.0)
  )
}

struct ProgressBar: View {
  let step: CGFloat
  
  let activityColor = Color(hexStringToUiColor(hex: "#48EAB6"))
  let inactiveColor = Color(hexStringToUiColor(hex: "#D3D3D3"))
  
  var body: some View {
    HStack {
      RoundedRectangle(cornerRadius: 8, style: .continuous)
        .frame(width: 70, height: 5)
        .foregroundColor(step >= 1 ? activityColor : inactiveColor)
      
      RoundedRectangle(cornerRadius: 8, style: .continuous)
        .frame(width: 170, height: 5)
        .foregroundColor(step >= 2 ? activityColor : inactiveColor)
      
      RoundedRectangle(cornerRadius: 8, style: .continuous)
        .frame(width: 70, height: 5)
        .foregroundColor(step >= 3 ? activityColor : inactiveColor)
      
    }.padding([.top, .bottom], 4)
  }
}

struct ContentNotification: View {
  let context: ActivityViewContext<NotificationAttributes>
  
  var body: some View {
    VStack(alignment: .leading) {
      HStack() {
        Image("logoBurgao")
          .resizable()
          .frame(width: 50, height: 50)
        
        VStack(alignment: .leading) {
          Text(context.attributes.restaurant)
            .font(.system(size: 18))
            .fontWeight(.bold)
            .foregroundColor(.black)
          
          Text("Pedido: **\(context.attributes.order)**")
            .font(.headline)
            .foregroundColor(.black)
        }
      }
      
      Text(context.state.status)
        .font(.subheadline)
        .foregroundColor(.black)
      
      ProgressBar(step: context.state.step)
      
      Text(context.state.description)
        .font(.subheadline)
        .foregroundColor(.gray)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .padding(16)
  }
}

struct ContentDynamicExpanded: View {
  var body: some View {
    VStack {
      
    }
  }
}

struct NotificationWidgetView: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: NotificationAttributes.self) { context in
      ContentNotification(context: context)
    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading, priority: 1) {
          ContentDynamicExpanded()
        }
      } compactLeading: {
        Text("Leading")
      } compactTrailing: {
        Text("Trailing")
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
