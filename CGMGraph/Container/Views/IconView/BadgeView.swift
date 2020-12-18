//
//  BadgeView.swift
//  Graph
//
//  Created by Julio Montoya on 10/27/20.
//

import UIKit

public class BadgeView: NiblessView {
  
  // MARK: - Properties
  private let type: BadgeViewType
  
  private var title: String = ""
  
  // MARK: - Object Lifecycle
  public init(frame: CGRect, type: BadgeViewType) {
    self.type = type
    title = type.rawValue
    super.init(frame: frame)
    setupStyles(frame: frame)
  }
  
  public override func draw(_ rect: CGRect) {
    let style = NSMutableParagraphStyle()
    style.alignment = NSTextAlignment.center
    let attributes: [NSAttributedString.Key: Any] = [
      .font: UIFont.boldSystemFont(ofSize: 12),
      .foregroundColor: UIColor.white,
      .paragraphStyle: style
    ]
    
    let text = "\(title)" as NSString
    let size = text.size(withAttributes: attributes)
    text.draw(at: CGPoint(x: rect.size.width/2 - size.width/2, y: rect.size.height/2 - size.height/2), withAttributes: attributes)
  }
  
  // MARK: - Styles
  private func setupStyles(frame: CGRect) {
    layer.cornerRadius = frame.width/2
    layer.masksToBounds = true
    backgroundColor = .black
  }
  
  public func update(type: BadgeViewType) {
    title = type.rawValue
    setNeedsDisplay()
  }
}
