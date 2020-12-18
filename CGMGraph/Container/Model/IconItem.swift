//
//  IconItem.swift
//  Graph
//
//  Created by Julio Montoya on 10/27/20.
//

import Foundation

public struct IconItem {
  
  // MARK: - Output
  public let identifier = UUID().uuidString
  
  // MARK: - Properties
  public let badge: BadgeViewType
  public let type: IconViewType
  
  // MARK: - Object Lifecycle
  public init(type: IconViewType, badge: BadgeViewType) {
    self.badge = badge
    self.type = type
  }
}
