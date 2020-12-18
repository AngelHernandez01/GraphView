//
//  EventItem.swift
//  Graph
//
//  Created by Julio Montoya on 10/19/20.
//

import UIKit

public struct EventItem {
  // MARK: - Outputs
  public let size = CGSize(width: 70, height: 20)
  public let identifier = UUID().uuidString
  public let height: Int = 35
  
  // MARK: - Properties
  public let eventType: EventType
}
