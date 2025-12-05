import Foundation

@objc(Example)
public class Example: NSObject {
  @objc
  public func printMessage() {
    print("My message with turbo module with SWift")
  }
  
  @objc
  public func returnMessage() -> String {
    return "My returned message from swift"
  }
  
  @objc
  public func paramsFunction(_ name: String, _ age: Int) -> String {
    return "Hello \(name), you are \(age) years old"
  }
}
