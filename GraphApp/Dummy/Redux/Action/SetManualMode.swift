//
//  SetManualMode.swift
//  Graph
//
//  Created by Julio Montoya on 11/8/20.
//

import Foundation

public struct SetManualMode: Action {
  
  // MARK: - Properties
  public var graphModeState: GraphViewStateType = .manual
  public var alerts: [AlertItem]
  public var areas: [AreaItem]
  public var items: [Int]
  public var iob: String
  
  // MARK: - Object Lifecycle
  public init(items: [Int], alerts: [AlertItem], areas: [AreaItem], iob: String) {
    self.alerts = alerts
    self.areas = areas
    self.items = items
    self.iob = iob
  }
}
