//
//  SegmentedStates.swift
//  GraphView
//
//  Created by Julio Montoya on 9/22/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import Foundation

public enum SegmentedHourState: Int, CaseIterable {
  case three = 3
  case six = 6
  case twelve = 12
  case twentyFour = 24
}

public enum SegmentedButtonState {
  case normal, selected
}
