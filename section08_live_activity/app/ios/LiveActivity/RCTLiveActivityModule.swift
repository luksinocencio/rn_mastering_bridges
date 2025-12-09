import Foundation
import ActivityKit

@objc(RCTLiveActivityModule)
public class RCTLiveActivityModule: NSObject {

  @objc
  public func startNotification(
    _ restaurant: String,
    _ order: String,
    _ status: String,
    _ decription: String,
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
    _ decription: String,
    _ step: CGFloat,
    _ stepMessage: String,
    _ imageStep: String
  ) {
    print("""
    updateNotification
    status: \(status)
    decription: \(decription)
    step: \(step)
    stepMessage: \(stepMessage)
    imageStep: \(imageStep)
    """)
  }
  
  @objc
  public func cancelNotification(
    _ status: String,
    _ decription: String,
    _ step: CGFloat,
    _ stepMessage: String,
    _ imageStep: String
  ) {
    print("""
    cancelNotification
    status: \(status)
    decription: \(decription)
    step: \(step)
    stepMessage: \(stepMessage)
    imageStep: \(imageStep)
    """)
  }
}
