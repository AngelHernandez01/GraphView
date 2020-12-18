//
//  ActionDispatcher.swift
//  CustomRedux
//
//  Created by Julio Montoya on 11/6/20.
//

import Foundation

public protocol ActionDispatcher {
  func dispatch(_ action: Action)
}

extension Store: ActionDispatcher {}
