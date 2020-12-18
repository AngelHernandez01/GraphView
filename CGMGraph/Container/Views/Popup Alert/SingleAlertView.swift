//
//  SingleAlertView.swift
//  ViewApp
//
//  Created by Julio Montoya on 10/15/20.
//  Copyright © 2020 Insulet. All rights reserved.
//

import UIKit

public class SingleAlertView: NiblessView {
  
  // MARK: - Views
  private lazy var verticalStack: UIStackView = {
    let stack = UIStackView(arrangedSubviews: [timeLabel, descriptionLabel])
    stack.axis = .vertical
    return stack
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 18)
    label.textColor = .white
    label.numberOfLines = 0
    label.backgroundColor = .clear
    return label
  }()
  
  private lazy var timeLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16)
    label.textColor = .lightGray
    label.numberOfLines = 1
    label.backgroundColor = .clear
    
    label.heightAnchor.constraint(equalToConstant: 25).isActive = true
    
    return label
  }()
  
  // MARK: - Properties
  
  // MARK: - Object Lifecycle
  public init(frame: CGRect = .zero, time: String, description: String) {
    super.init(frame: frame)
    timeLabel.text = time
    descriptionLabel.text = description
    constructViews()
  }
  
  // MARK: - Layout
  private func constructViews() {
    addSubview(verticalStack)
    verticalStack.equalConstraints(to: self)
  }
}
