//
//  NiblessView.swift
//  Graph
//
//  Created by Julio Montoya on 10/26/20.
//

import UIKit

open class NiblessView: UIView {
  
  // MARK: - Object Lifecycle
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }

  @available(*, unavailable,
    message: "Loading this view from a nib is unsupported in favor of initializer dependency injection."
  )
  public required init?(coder aDecoder: NSCoder) {
    print("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    return nil
  }
}
