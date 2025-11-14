import React
import Foundation

@objc(RCTExampleModule)
class RCTExampleModule: RCTEventEmitter {
  
  /// Exemplo de módulo nativo exposto ao React Native.
  /// A anotação @objc permite que o módulo e seus métodos
  /// sejam acessados via JavaScript.
  ///
  /// O método `printMessage` pode ser chamado pelo lado
  /// JavaScript e executará um código nativo em Swift.
  
  @objc
  func printMessage(_ title: String, _ value: NSNumber) {
    print("Olá, \(title), Você tem \(value) anos.")
  }
  
  @objc
  func returnMessage(
    _ title: String,
    resolver resolve: @escaping RCTPromiseResolveBlock,
    rejecter reject: @escaping RCTPromiseRejectBlock
  ) {
    if title == "Lucas" {
      resolve("Message processed: \(title)")
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
