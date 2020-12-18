//
//  GraphState.swift
//  Graph
//
//  Created by Julio Montoya on 11/6/20.
//

import Foundation

public struct GraphState: StateType {
  
  // MARK: - Properties
  public var graphModeState: GraphViewStateType = .noData
  public var rangeState: TimeRangeState = .three
  public var alerts: [AlertItem] = []
  public var events: [EventItem] = []
  public var icons: [IconItem] = []
  public var areas: [AreaItem] = []
  public var items: [Int] = []
  public var cgm: String = "--"
  public var iob: String = "--"
}
