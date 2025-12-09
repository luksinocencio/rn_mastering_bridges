import ActivityKit
import Foundation

struct AdventuresAttributes: ActivityAttributes {
  public typealias NotificationStatus = ContentState
  
  public struct ContentState: Codable, Hashable {
    var status: String
    var description: String
    var step: CGFloat
    var stepMessage: String
    var imageStep: String
  }
  
  var restaurant: String
  var order: String
}
