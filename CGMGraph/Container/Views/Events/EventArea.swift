//
//  EventArea.swift
//  Graph
//
//  Created by Julio Montoya on 10/25/20.
//

import UIKit

public class EventArea: NiblessView, EventIdentifier {
  
  // MARK: - Properties
  private let eventAreaType: EventAreaType
  public var identifier: String
  
  // MARK: - Object Lifecycle
  public init(frame: CGRect, eventAreaType: EventAreaType, identifier: String) {
    self.eventAreaType = eventAreaType
    self.identifier = identifier
    super.init(frame: frame)
    styleView()
  }
  
  // MARK: - Styles
  private func styleView() {
    backgroundColor = eventAreaType.color()
  }
}
