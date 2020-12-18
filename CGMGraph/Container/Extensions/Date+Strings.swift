//
//  Date+Strings.swift
//  GraphView
//
//  Created by Julio Montoya on 9/28/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

extension Date {
  public func toString() -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh a"
    let hourString = formatter.string(from: self)
    return hourString
  }
}

extension String {
  public static let none = "void"
}
