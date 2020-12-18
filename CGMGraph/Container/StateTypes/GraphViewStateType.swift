//
//  GraphViewStateType.swift
//  Graph
//
//  Created by Julio Montoya on 11/5/20.
//

import UIKit

public enum GraphViewStateType: String {
  case noData = "--"
  case limited = "Limited"
  case manual = "Manual"
  case automated = "-- "
  case tappable = "Tappable"
  
  public var color: UIColor {
    typealias style = GraphViewStyle
    
    switch self {
    case .noData:
      return style.placeholderView.color
    case.automated:
      return style.eventAreaColor(.automated)
    case .limited:
      return style.eventAreaColor(.limited)
    case.manual:
      return style.eventAreaColor(.manual)
    case.tappable:
      return style.eventAreaColor(.manual)
    }
  }
}
