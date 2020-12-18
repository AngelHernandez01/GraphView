//
//  BottomSideViewDelegate.swift
//  Graph
//
//  Created by Julio Montoya on 10/26/20.
//

import UIKit

public protocol BottomSideViewDelegate: class {
  func didTappedEvent(identifier: String, positionX: CGFloat)
}
