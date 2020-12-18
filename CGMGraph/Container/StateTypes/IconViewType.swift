//
//  IconViewType.swift
//  Graph
//
//  Created by Julio Montoya on 10/27/20.
//

import UIKit

public enum IconViewType {
  
  // MARK: - Cases
  case bolus
  case pod
  
  // MARK: - Styles
  public func image() -> UIImage {
    func makeAsset(named: String) -> UIImage {
      let bundle = Bundle(for: GraphContainer.self)
      return UIImage(named: named, in: bundle, compatibleWith: nil)!
    }
    
    switch self {
    case .bolus:
      return makeAsset(named: "bolusCalculated")
     case .pod:
      return makeAsset(named: "podDiscarded")
    }
  }
}
