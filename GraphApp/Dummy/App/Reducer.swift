//
//  Reducer.swift
//  CustomRedux
//
//  Created by Julio Montoya on 11/5/20.
//

import Foundation

public typealias Reducer = (_ action: Action, _ state: StateType?) -> StateType
