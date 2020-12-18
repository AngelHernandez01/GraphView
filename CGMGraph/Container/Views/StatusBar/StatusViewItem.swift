//
//  StatusView.swift
//  GraphView
//
//  Created by Julio Montoya on 9/20/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

public class StatusViewItem: NiblessView {
  
  // MARK: - Views
  private lazy var horizontalStack: UIStackView = {
    let stackView = makeStackView(axis: .horizontal)
    stackView.addArrangedSubview(titleLabel)
    
    statusImage.activateConstraints([
      statusImage.heightAnchor.constraint(equalToConstant: 25),
      statusImage.widthAnchor.constraint(equalToConstant: 25)
    ])
    
    stackView.addArrangedSubview(statusImage)
    stackView.spacing = 0
    return stackView
  }()
  
  private lazy var verticalStack: UIStackView = {
    let stackView = makeStackView(axis: .vertical)
    stackView.addArrangedSubview(horizontalStack)
    stackView.addArrangedSubview(descriptionLabel)
    return stackView
  }()
  
  public let descriptionLabel: UILabel = {
    let label = UILabel()
    label.text = "mg/dl"
    label.textColor = .black
    label.font = .boldSystemFont(ofSize: 15)
    return label
  }()
  
  public let statusImage: StatusImage = {
    let imageView = StatusImage()
    imageView.backgroundColor = .clear
    return imageView
  }()
  
  public let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "121"
    label.textColor = .black
    label.font = .boldSystemFont(ofSize: 30)
    return label
  }()
  
  // MARK: - Properties
  private let statusType: StatusViewItemType
  
  // MARK: - Object Lifecycle
  public init(frame: CGRect = .zero, type: StatusViewItemType = .cgm) {
    statusType = type
    super.init(frame: frame)
    commonSetup()
  }
  
  public override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { fatalError() }
    drawDelimiterLine(context: context)
  }
  
  // MARK: - Initializers
  private func commonSetup() {
    setupStyle()
    setupStackViews()
  }
  
  private func setupStyle() {
    backgroundColor = .clear
    statusImage.isHidden = (statusType == .iob)
  }
  
  private func setupStackViews() {
    addSubview(verticalStack)
    verticalStack.equalConstraints(to: self, leading: 20)
  }
  
  // MARK: - Drawings
  private func drawDelimiterLine(context: CGContext) {
    let path = UIBezierPath()
    path.move(to: .zero)
    path.addLine(to: [0, bounds.height])
    UIColor.lightGray.setStroke()
    path.stroke()
  }
  
  // MARK: - Attributed Style
  public func setIOBStyle(_ title: String) {
    func makeIOBTitle(from iobTitle: String) -> NSAttributedString {
      guard let lastCharacter = iobTitle.last else { fatalError() }
      
      let range = (iobTitle as NSString).range(of: String(lastCharacter))
      let attributes: [NSAttributedString.Key: Any] = [
        .font: UIFont.boldSystemFont(ofSize: 22),
        .foregroundColor: UIColor.black
      ]
      
      let iobAttributedString = NSMutableAttributedString(string: iobTitle)
      iobAttributedString.setAttributes(attributes,range: range)
      return iobAttributedString
    }
    
    titleLabel.attributedText = makeIOBTitle(from: title)
    descriptionLabel.text = "IOB"
  }
  
  public func setPlaceholderValues() {
    titleLabel.text = "--"
    statusImage.isHidden = true
  }
}

// MARK: - Factories
extension StatusViewItem {
  fileprivate func makeStackView(axis: NSLayoutConstraint.Axis) -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = axis
    stackView.distribution = .fillProportionally
    stackView.spacing = .zero
    return stackView
  }
}
