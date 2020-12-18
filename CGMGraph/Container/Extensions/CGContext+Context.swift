import UIKit

extension CGContext {
  public func restoreGate(context: (CGContext) -> Void) {
    self.saveGState()
    context(self)
    self.restoreGState()
  }
}
