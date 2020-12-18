import UIKit

extension CGPoint: ExpressibleByArrayLiteral {
  public init(arrayLiteral elements: CGFloat...) {
    assert(elements.count == 2)
    self.init(x: elements[0], y: elements[1])
  }
}
