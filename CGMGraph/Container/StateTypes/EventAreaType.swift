//
//  EventAreaType.swift
//  Graph
//
//  Created by Julio Montoya on 10/25/20.
//

import UIKit

public enum EventAreaType: String, CaseIterable {
  
  // MARK: - Cases
  case manual
  case limited
  case progress
  case automated
   
  // MARK: - Styles
  public func color() -> UIColor {
    return GraphViewStyle.eventAreaColor(self)
  }
  
  public func identifier() -> String {
    return self.rawValue
  }
}
