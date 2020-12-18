//
//  EventArea.swift
//  Graph
//
//  Created by Julio Montoya on 10/20/20.
//

import UIKit

public struct AreaItem {
  
  // MARK: - Output
  public let identifier = UUID().uuidString
  
  // MARK: - Properties
  public let eventAreaType: EventAreaType
  public let originX: CGFloat
  public let width: CGFloat?
  
  // MARK: - Object Lifecycle
  public init(eventAreaType: EventAreaType, originX: CGFloat = 0, width: CGFloat? = nil) {
    self.eventAreaType = eventAreaType
    self.originX = originX
    self.width = width
  }
}
