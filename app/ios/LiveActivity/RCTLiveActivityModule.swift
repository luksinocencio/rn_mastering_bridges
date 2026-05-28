import Foundation
import ActivityKit

@objc(RCTLiveActivityModule)
public class RCTLiveActivityModule: NSObject {

  @objc
  public func startNotification(
    _ restaurant: String,
    _ order: String,
    _ status: String,
    _ description: String,
    _ step: CGFloat,
    _ stepMessage: String,
    _ imageStep: String
  ) {
    
    let attributesNotification = NotificationAttributes(restaurant: restaurant, order: order)
    
    let contentNotification = NotificationAttributes.ContentState(
      status: status, description: description, step: step, stepMessage: stepMessage, imageStep: imageStep
    )
    
    do {
      if #available(iOS 16.1, *) {
        _ = try Activity.request(attributes: attributesNotification, contentState: contentNotification)
      } else {
        // Fallback on earlier versions
      }
    } catch (_) {
      print("Error")
    }
  }
  
  @objc
  public func updateNotification(
    _ status: String,
    _ description: String,
    _ step: CGFloat,
    _ stepMessage: String,
    _ imageStep: String
  ) {
    
    let contentState = NotificationAttributes.ContentState(
      status: status,
      description: description,
      step: step,
      stepMessage: stepMessage,
      imageStep: imageStep
    )
    
    if #available(iOS 16.1, *) {
      let alertConfiguration = AlertConfiguration(title: "Title alert", body: "body", sound: .default)
      Task {
        for activity in Activity<NotificationAttributes>.activities {
          await activity.update(using: contentState, alertConfiguration: alertConfiguration)
        }
      }
    } else {
      print("Other version iOS")
    }
  }
  
  @objc
  public func cancelNotification(
    _ status: String,
    _ description: String,
    _ step: CGFloat,
    _ stepMessage: String,
    _ imageStep: String
  ) {

    let contentState = NotificationAttributes.ContentState(
      status: status,
      description: description,
      step: step,
      stepMessage: stepMessage,
      imageStep: imageStep
    )
    
    if #available(iOS 16.1, *) {
      let alertConfiguration = AlertConfiguration(title: "Title alert", body: "body", sound: .default)
      Task {
        for activity in Activity<NotificationAttributes>.activities {
          await activity.end(using: contentState, dismissalPolicy: .default)
        }
      }
    } else {
      print("Other version iOS")
    }
  }
}
