//
//  Box.swift
//  GraphView
//
//  Created by Julio Montoya on 9/21/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import Foundation

public final class Box<T> {
  
  // MARK: - Properties
  public typealias Observer = (T) -> Void
  private var observer: Observer?
  
  public var value: T {
    didSet {
      observer?(value)
    }
  }
  
  // MARK: - Object Lifecycle
  public init(_ value: T) {
    self.value = value
  }
  
  // MARK: - Bindings
  public func bind(observer: Observer?) {
    self.observer = observer
    observer?(value)
  }
}
