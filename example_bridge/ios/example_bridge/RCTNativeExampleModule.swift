import UIKit

@objc(RCTNativeExampleModule)
class RCTNativeExampleModule: NSObject {
  @objc
  func printMessage(_ name: String, _ age: NSNumber) {
    print("Meu chamo \(name) e tenho \(age) anos!")
  }
}
