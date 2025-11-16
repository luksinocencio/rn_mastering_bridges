import React
import Foundation

@objc(RCTNativeExampleModule)
class RCTNativeExampleModule: RCTEventEmitter {
  
  @objc
  func printMessage(_ name: String, _ age: NSNumber) {
    print("Olá, \(name), Você tem \(age) anos.")
  }
  
  @objc
  func returnMessage(
    _ name: String,
    resolver resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: @escaping RCTPromiseRejectBlock
  ) {
    if name == "Lucas" {
      resolve("Message processed: \(name)")
    } else {
      let error = NSError(domain: "", code: 200, userInfo: [NSLocalizedDescriptionKey: "Titutlo de erro"])
      reject("Error", "Mensagem de erro", error)
    }
  }
  
  @objc
  func eventMessage(_ value: CGFloat) {
    sendEvent(withName: "onMessagePrinted", body: ["value": value])
  }
  
  override func supportedEvents() -> [String]! {
    return ["onMessagePrinted"]
  }
}
