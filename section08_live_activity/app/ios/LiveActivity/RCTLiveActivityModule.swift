import Foundation

@objc(RCTLiveActivityModule)
public class RCTLiveActivityModule: NSObject {

  @objc
  public func startNotification() {
    print("start notification")
  }
  
  @objc
  public func updateNotification() {
    print("update notifcation")
  }
  
  @objc
  public func cancelNotification() {
    print("cancel notifcation")
  }
}
