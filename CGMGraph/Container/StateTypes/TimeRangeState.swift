//
//  TimeRangeState.swift
//  GraphView
//
//  Created by Julio Montoya on 9/29/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import Foundation

public enum TimeRangeState: Int, CaseIterable {
  
  // MARK: - Cases
  case three = 3
  case six = 6
  case twelve = 12
  case twentyFour = 24
  
  // MARK: - Date Strings
  public func availableTime(date: Date = .init()) -> [String] {
    var stringTimes: [String] = ["Now"]
    
    for index in 1...self.rawValue {
      if let earlyDate = Calendar.current.date(byAdding: .hour, value: -index, to: date) {
        stringTimes.append(earlyDate.toString())
      }
    }
    
    return Array(stringTimes.reversed())
  }
}
