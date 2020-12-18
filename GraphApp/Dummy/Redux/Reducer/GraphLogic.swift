//
//  GraphLogic.swift
//  Graph
//
//  Created by Julio Montoya on 11/6/20.
//

import Foundation

public struct GraphLogic {
  
  // MARK: - Logic
  public static func graphNoDataState(for action: NoDataAvailable) -> GraphState {
    var newState = GraphState()
    newState.graphModeState = action.graphModeState
    newState.items = action.items
    newState.areas = action.areas
    return newState
  }
  
  public static func graphLimitedState(for action: SetLimitedMode) -> GraphState {
    var newState = GraphState()
    newState.graphModeState = action.graphModeState
    newState.alerts = action.alerts
    newState.areas = action.areas
    newState.items = action.items
    newState.iob = action.iob
    return newState
  }
  
  public static func graphManualState(for action: SetManualMode) -> GraphState {
    var newState = GraphState()
    newState.graphModeState = action.graphModeState
    newState.alerts = action.alerts
    newState.areas = action.areas
    newState.items = action.items
    newState.iob = action.iob
    return newState
  }
  
  public static func graphAutomatedState(for action: SetAutomatedMode) -> GraphState {
    var newState = GraphState()
    newState.graphModeState = action.graphModeState
    newState.alerts = action.alerts
    newState.areas = action.areas
    newState.items = action.items
    return newState
  }
  
  public static func graphTappableState(for action: SetTappableItemsMode) -> GraphState {
    var newState = GraphState()
    newState.graphModeState = action.graphModeState
    newState.events = action.events
    newState.alerts = action.alerts
    newState.areas = action.areas
    newState.items = action.items
    newState.icons = action.icons
    newState.cgm = action.cgm
    newState.iob = action.iob
    return newState
  }
}
