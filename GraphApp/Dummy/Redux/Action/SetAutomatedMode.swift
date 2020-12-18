//
//  SetAutomatedMode.swift
//  Graph
//
//  Created by Julio Montoya on 11/8/20.
//

import Foundation

public struct SetAutomatedMode: Action {
  
  // MARK: - Properties
  public var graphModeState: GraphViewStateType = .automated
  public var alerts: [AlertItem]
  public var areas: [AreaItem]
  public var items: [Int]
  
  // MARK: - Object Lifecycle
  public init(items: [Int], alerts: [AlertItem], areas: [AreaItem]) {
    self.alerts = alerts
    self.areas = areas
    self.items = items
  }
}
