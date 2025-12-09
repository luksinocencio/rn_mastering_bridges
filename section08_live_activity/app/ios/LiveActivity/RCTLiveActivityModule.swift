import Foundation

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
    print("""
    startNotification
    restaurant: \(restaurant)
    order: \(order)
    status: \(status)
    decription: \(decription)
    step: \(step)
    stepMessage: \(stepMessage)
    imageStep: \(imageStep)
    """)
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
