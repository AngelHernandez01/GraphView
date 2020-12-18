//
//  AlertItem.swift
//  ViewApp
//
//  Created by Julio Montoya on 10/15/20.
//  Copyright © 2020 Insulet. All rights reserved.
//

import UIKit

public struct AlertItem {
  
  // MAKR: - Output
  public var bottomPadding: CGFloat {
    return isIcon ? 20 : -20
  }
  
  // MARK: - Properties
  public let isIcon: Bool
  public let time: String
  public let description: String
  public let belongTo: String
  
  // MARK: - Object Lifecycle
  public init(isIcon: Bool = false, time: String, description: String, belongTo: String) {
    self.isIcon = isIcon
    self.time = time
    self.description = description
    self.belongTo = belongTo
  }
}
