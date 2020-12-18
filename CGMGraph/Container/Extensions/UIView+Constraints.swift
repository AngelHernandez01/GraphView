//
//  UIView+Constraints.swift
//  GraphView
//
//  Created by Julio Montoya on 9/21/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

extension UIView {
  public func activateConstraints(_ constraints: [NSLayoutConstraint]) {
    self.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate(constraints)
  }
  
  public func insertAndLayout(view: UIView, constraints: [NSLayoutConstraint]) {
    addSubview(view)
    view.activateConstraints(constraints)
  }
  
  public func equalConstraints(to view: UIView, top: CGFloat = 0, bottom: CGFloat = 0, leading: CGFloat = 0, trailing: CGFloat = 0) {
    self.activateConstraints([
      self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading),
      self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: trailing),
      self.topAnchor.constraint(equalTo: view.topAnchor, constant: top),
      self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottom)
    ])
  }
}
