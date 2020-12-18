//
//  GraphReducer.swift
//  Graph
//
//  Created by Julio Montoya on 11/6/20.
//

import Foundation

public func graphReducer(action: Action, state: StateType?) -> StateType {
  var state = (state as? GraphState) ?? GraphState()
  
  switch action {
  case let action as NoDataAvailable:
    state = GraphLogic.graphNoDataState(for: action)
  case let action as SetLimitedMode:
    state = GraphLogic.graphLimitedState(for: action)
  case let action as SetManualMode:
    state = GraphLogic.graphManualState(for: action)
  case let action as SetAutomatedMode:
    state = GraphLogic.graphAutomatedState(for: action)
  case let action as SetTappableItemsMode:
    state = GraphLogic.graphTappableState(for: action)
  default: ()
  }
  
  return state
}
