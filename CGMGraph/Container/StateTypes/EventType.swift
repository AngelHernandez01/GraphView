//
//  EventType.swift
//  Graph
//
//  Created by Julio Montoya on 10/18/20.
//

import UIKit

public enum EventType: String, CaseIterable {
  
  // MARK: - Cases
  case hypoProtect
  case maximumBasal
  case pausedInsulin
  case limitedMode
  
  // MARK: - Styles
  public func color() -> UIColor {
    return GraphViewStyle.eventColor(self)
  }
  
  public func identifier() -> String {
    return self.rawValue
  }
}
