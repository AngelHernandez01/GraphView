//
//  Store.swift
//  CustomRedux
//
//  Created by Julio Montoya on 11/5/20.
//

import Foundation

public class Store {
  
  // MARK: - Properties
  private var subscribers: [StoreSubscriber] = []
  private let reducer: Reducer
  private var state: StateType?
  
  // MARK: - Object Lifecycle
  public init(reducer: @escaping Reducer, state: StateType?) {
    self.reducer = reducer    
    self.state = state
  }
  
  // MARK: - Redux
  public func dispatch(_ action: Action) {
    guard !subscribers.isEmpty else { return }
    state = reducer(action, state)
    subscribers.forEach { $0.newState(state: state!) }
  }
  
  public func subscribe(_ newSubscriber: StoreSubscriber) {
    subscribers.removeAll()
    subscribers.append(newSubscriber)
    guard state == nil else { return }
    dispatch(CustomInit())
  }
  
  // TODO: - Implement Scalable Subscribers
  public func unsubscribe<T: StoreSubscriber>(_ subscriber: T) {
    guard !subscribers.isEmpty else { return }
    subscribers.removeAll()
  }
}
