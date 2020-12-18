//
//  Queue.swift
//  Graph
//
//  Created by Julio Montoya on 10/24/20.
//

import Foundation

public struct Queue<T> {
  
  // MARK: - Properties
  private var items: [T] = []
  
  public var isEmpty: Bool {
    items.isEmpty
  }
  
  public var count: Int {
    items.count
  }
  
  public var peek: T? {
    items.first
  }
  
  // MARK: - Object Lifecycle
  public init() {}
  
  public mutating func enqueue(_ element: T) {
    items.append(element)
  }
  
  public mutating func dequeue() -> T? {
    isEmpty ? nil : items.removeFirst()
  }
}

