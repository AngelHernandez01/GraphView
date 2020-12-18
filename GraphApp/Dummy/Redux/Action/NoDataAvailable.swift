//
//  NoDataAvailable.swift
//  Graph
//
//  Created by Julio Montoya on 11/6/20.
//

import Foundation

public struct NoDataAvailable: Action {
  
  // MARK: - Properties
  public var graphModeState: GraphViewStateType = .noData
  public var areas: [AreaItem] = []
  public var items: [Int] = []
}
