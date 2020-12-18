//
//  SetTappableItemsMode.swift
//  CommonUI
//
//  Created by Julio Montoya on 11/10/20.
//  Copyright © 2020 Insulet. All rights reserved.
//

import Foundation

public struct SetTappableItemsMode: Action {
  
  // MARK: - Properties
  public var graphModeState: GraphViewStateType = .tappable
  public var events: [EventItem]
  public var alerts: [AlertItem]
  public var areas: [AreaItem]
  public var icons: [IconItem]
  public var items: [Int]
  public var cgm: String
  public var iob: String
  
  // MARK: - Object Lifecycle
  public init(items: [Int], events: [EventItem], areas: [AreaItem], icons: [IconItem], alerts: [AlertItem], cgm: String, iob: String) {
    self.events = events
    self.alerts = alerts
    self.areas = areas
    self.items = items
    self.icons = icons
    self.cgm = cgm
    self.iob = iob
  }
}
