//
//  UIColor+RGB.swift
//  Graph
//
//  Created by Julio Montoya on 10/5/20.
//

import UIKit

extension UIColor {
  public static func rgb(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
    return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
  }
  
  public static func singleRGB(_ value: CGFloat, alpha: CGFloat = 1) -> UIColor {
    return UIColor.rgb(value, value, value, alpha: alpha)
  }
}
