//
//  PopupAlertView.swift
//  ViewApp
//
//  Created by Julio Montoya on 10/15/20.
//  Copyright © 2020 Insulet. All rights reserved.
//

import UIKit

public class PopupAlertView: NiblessView {
  
  // MARK: - Views
  private lazy var horizontalStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .equalSpacing
    return stackView
  }()
  
  // MARK: - Properties
  private let shouldAddSeparator: Bool
  
  public static let alertViewWidth = 140
  
  // MARK: - Object Lifecycle
  public init(origin: CGPoint = .zero, items: [AlertItem]) {
    assert(items.count > 0)
    shouldAddSeparator = (items.count > 1)
    let frame = CGRect(origin: origin, size: CGSize(width: PopupAlertView.alertViewWidth * items.count, height: 110))
    super.init(frame: frame)
    constructStackView(items: items)
    backgroundColor = .clear
    alpha = 0
  }
  
  public override func draw(_ rect: CGRect) {
    drawPopupBody()
    drawSeparator()
  }
  
  // MARK: - Initializers
  private func constructStackView(items: [AlertItem]) {
    addSubview(horizontalStackView)

    let padding: CGFloat = 20
    
    horizontalStackView.backgroundColor = .clear
    horizontalStackView.frame = CGRect(x: padding/2, y: 5, width: bounds.width - padding, height: bounds.height - padding)
    
    items.forEach { item in
      let singleAlert = SingleAlertView(frame: .zero, time: item.time, description: item.description)
      horizontalStackView.addArrangedSubview(singleAlert)
    }
  }
  
  // MARK: - Drawings
  private func drawPopupBody() {
    let maxX = horizontalStackView.bounds.midX
    let maxY = horizontalStackView.bounds.maxY + 5
    
    let path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height - 15), byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 10, height: 10))
    path.move(to: [maxX, maxY])
    path.addLine(to: [maxX + 10, maxY + 10])
    path.addLine(to: [maxX + 20, maxY])
    UIColor.black.setFill()
    path.fill()
    path.close()
  }
  
  private func drawSeparator() {
    guard shouldAddSeparator else { return }
    
    let linePath = UIBezierPath()
    linePath.move(to: [bounds.midX, bounds.minY + 5])
    linePath.addLine(to: [bounds.midX, bounds.maxY - 20])
    UIColor.init(red: 255, green: 255, blue: 255, alpha: 0.3).setStroke()
    linePath.stroke()
  }
}
