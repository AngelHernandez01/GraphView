//
//  EventView.swift
//  Graph
//
//  Created by Julio Montoya on 10/18/20.
//

import UIKit

public class EventView: NiblessView, EventIdentifier {
  
  // MARK: - Properties
  private let eventType: EventType
  public var identifier: String
  
  // MARK: - Object Lifecycle
  public init(frame: CGRect, eventType: EventType, identifier: String) {
    self.identifier = identifier
    self.eventType = eventType
    super.init(frame: frame)
    styleView()
  }
  
  // MARK: - Styles
  private func styleView() {
    backgroundColor = eventType.color()
    layer.borderColor = UIColor.white.cgColor
    layer.borderWidth = 2
    layer.cornerRadius = 2
  }
}
