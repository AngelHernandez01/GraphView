import UIKit

extension CATransaction {
  public static func disableAnimations(completion: () -> Void) {
    CATransaction.begin()
    CATransaction.setDisableActions(true)
    completion()
    CATransaction.commit()
  }
}
