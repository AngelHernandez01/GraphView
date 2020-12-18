//
//  IconView.swift
//  Graph
//
//  Created by Julio Montoya on 10/26/20.
//

import UIKit

public class IconView: NiblessView, EventIdentifier {
  
  // MARK: - Views
  private let iconImageView: UIImageView = {
    let imageView = UIImageView()
    return imageView
  }()
  
  // MARK: - Properties
  private let iconViewType: IconViewType
  public var identifier: String
  
  // MARK: - Object Lifecycle
  public init(frame: CGRect, type: IconViewType, badge: BadgeViewType, identifier: String) {
    self.identifier = identifier
    self.iconViewType = type
    super.init(frame: frame)
    setupBadgeView(type: badge)
    setupImageView()
    setupStyles()
  }
  
  public override func draw(_ rect: CGRect) {
    let path = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 6, height: 6))
    GraphViewStyle.iconView.color.setFill()
    path.fill()
  }
  
  // MARK: - Styles
  private func setupStyles() {
    backgroundColor = .clear
    isUserInteractionEnabled = true
  }
  
  // MARK: - Layout
  private func setupImageView() {
    iconImageView.image = iconViewType.image()
    addSubview(iconImageView)
    iconImageView.equalConstraints(to: self, top: 5, bottom: -5, leading: 5, trailing: -5)
    
    if iconViewType == .pod {
      iconImageView.transform = CGAffineTransform(rotationAngle: (180.0 * .pi) / 180.0)
    }
  }
  
  private func setupBadgeView(type: BadgeViewType) {
    let badge = BadgeView(frame: CGRect(x: 25, y: -5, width: 15, height: 15), type: type)
    addSubview(badge)
  }
}
