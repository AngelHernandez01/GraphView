//
//  UIGestureRecognizer+CGpoint.swift
//  GraphView
//
//  Created by Julio Montoya on 9/29/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

extension UIGestureRecognizer {
  public var locations: (CGPoint, CGPoint) {
    return (self.location(ofTouch: 0, in: self.view), self.location(ofTouch: 1, in: self.view))
  }
  
  public var pinchDistance: CGFloat {
    return CGPoint.distance(from: locations.0, to: locations.1)
  }
}
