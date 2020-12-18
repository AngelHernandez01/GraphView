//
//  UIView+CoordinateSystem.swift
//  Graph
//
//  Created by Julio Montoya on 10/26/20.
//

import UIKit

extension UIView {
  
  func convertCoordinateSystem(from subview: UIView) -> CGRect? {
    guard subview.isDescendant(of: self) else { return nil }
    
    var frame = subview.frame
    
    guard var superview = subview.superview else { return frame }
    
    while superview != self {
      frame = superview.convert(frame, to: superview.superview)
      
      if superview.superview == nil {
        break
      } else {
        if let parentSuperView = superview.superview {
          superview = parentSuperView
        }
      }
    }
    
    return superview.convert(frame, to: self)
  }
  
}
