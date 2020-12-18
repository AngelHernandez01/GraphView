//
//  SegmentedHour.swift
//  GraphView
//
//  Created by Julio Montoya on 9/20/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

@IBDesignable
public class SegmentedHour: UIControl {
  
  // MARK: - Output
  public let selectedHour = Box<SegmentedHourState>(.three)
  
  // MARK: - Properties
  private let stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.alignment = .fill
    stack.distribution = .fillEqually
    stack.spacing = 4
    return stack
  }()
  
  private let buttonTitles = [3, 6, 12, 24]
  
  // MARK: - Object Lifecycle
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupStackView()
    setupButtons()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  public override func awakeFromNib() {
    super.awakeFromNib()
    setupStackView()
    setupButtons()
  }
  
  public override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setupStackView()
    setupButtons()
  }
  
  // MARK: - Initializers
  private func setupStackView() {
    insertAndLayout(view: stackView, constraints: [
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  private func setupButtons() {
    buttonTitles
      .map { [weak self] index -> UIButton in
        let button = UIButton(type: .roundedRect)
        button.setTitle("\(index) hr", for: .normal)
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        button.tag = index
        let state: SegmentedButtonState = (button.tag == 3) ? .selected : .normal
        self?.style(button: button, state: state)
        return button
      }.forEach { button in
        stackView.addArrangedSubview(button)
        button.addTarget(self, action: #selector(self.handleButtonState(with:)), for: .touchUpInside)
      }
  }
  
  // MARK: - Style
  private func style(button: UIButton, state: SegmentedButtonState) {
    switch state {
    case .normal:
      button.setTitleColor(.black, for: .normal)
      button.backgroundColor = #colorLiteral(red: 0.8238154054, green: 0.8188886046, blue: 0.8286994696, alpha: 1)
    case .selected:
      button.setTitleColor(.white, for: .normal)
      button.backgroundColor = .darkGray
    }
  }
  
  private func handleButtonsStyle(with tag: Int) {
    stackView
      .arrangedSubviews
      .map { $0 as! UIButton }
      .forEach { [weak self] button in
        guard let self = self else { return }
        let state: SegmentedButtonState = (button.tag == tag) ? .selected : .normal
        self.style(button: button, state: state)
      }
  }
  
  // MARK: - Bindings
  private func bindValue(with tag: Int) {
    selectedHour.value = SegmentedHourState(rawValue: tag)!
  }
  
  // MARK: - Actions
  @objc private func handleButtonState(with button: UIButton) {
    let tag = button.tag
    handleButtonsStyle(with: tag)
    bindValue(with: tag)
  }
}
