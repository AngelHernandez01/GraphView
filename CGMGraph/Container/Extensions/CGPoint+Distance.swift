//
//  CGPoint+Distance.swift
//  GraphView
//
//  Created by Julio Montoya on 9/29/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

extension CGPoint {
  private static func distanceSquared(from: CGPoint, to: CGPoint) -> CGFloat {
      return (from.x - to.x) * (from.x - to.x) + (from.y - to.y) * (from.y - to.y)
  }

  public static func distance(from: CGPoint, to: CGPoint) -> CGFloat {
      return sqrt(distanceSquared(from: from, to: to))
  }
}
