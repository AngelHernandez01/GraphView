//
//  GraphColors.swift
//  GraphView
//
//  Created by Julio Montoya on 10/2/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

public enum GraphViewStyle: CaseIterable {
  
  // MARK: - Outputs
  public static func eventAreaColor(_ eventType: EventAreaType) -> UIColor {
    switch eventType {
    case .manual:
      return .rgb(154, 188, 240)
    case .limited:
      return .rgb(103, 115, 133)
    case .progress:
      return .rgb(129, 223, 133)
    case .automated:
      return .rgb(176, 161, 224)
    }
  }
  
  public static func eventColor(_ eventType: EventType) -> UIColor {
    switch eventType {
    case .hypoProtect:
      return .rgb(97, 222, 118)
    case .maximumBasal:
      return .rgb(245, 162, 0)
    case .pausedInsulin:
      return .rgb(232, 80, 67)
    case .limitedMode:
      return .rgb(90, 105, 123)
    }
  }
  
  // MARK: - Cases
  case middleBar, topBar, bottomBar, placeholder
  case dashedLine, horizontal, rightArrow, iconView
  case statusTitle, dexcom, placeholderView
  
  // MARK: - Properties
  public var color: UIColor {
    switch self {
    case .middleBar:
      return .singleRGB(245)
    case .topBar:
      return .rgb(237, 201, 131)
    case .bottomBar:
      return .rgb(226, 147, 144)
    case .dashedLine:
      return .singleRGB(210)
    case .horizontal:
      return .rgb(137, 183, 241)
    case .rightArrow:
      return .rgb(67, 120, 233)
    case .iconView:
      return .singleRGB(240)
    case .statusTitle:
      return .rgb(67, 120, 233)
    case .placeholder:
      return .singleRGB(0, alpha: 0.5)
    case .dexcom:
      return .rgb(132, 133, 149)
    case .placeholderView:
      return .singleRGB(255, alpha: 0.7)
    }
  }
}
