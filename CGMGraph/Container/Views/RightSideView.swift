//
//  RightSideView.swift
//  GraphView
//
//  Created by Julio Montoya on 9/21/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

public class RightSideView: NiblessView {
  
  // MARK: - Properties
  private var gap: CGFloat {
    return bounds.height / (CGFloat(units.count) + 1.0)
  }
  
  public var units = Array([40, 80, 120, 200, 300, 400].reversed())
  
  public var orientation: GraphOrientation = .portrait {
    didSet {
      setNeedsDisplay()
    }
  }
  
  // MARK: - Object Lifecycle
  public override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { fatalError() }
    drawRightTextColumn(context: context)
  }
  
  // MARK: - Drawings
  private func drawRightTextColumn(context: CGContext) {
    let font = UIFont.systemFont(ofSize: 14)
    var attributes: [NSAttributedString.Key: Any] = [.font: font]
    let margin: CGFloat = 12
    
    let style = NSMutableParagraphStyle()
    style.alignment = NSTextAlignment.center
    
    context.restoreGate { gate in
      units.forEach { unit in
        switch unit {
        case 40:
          gate.translateBy(x: 0, y: (orientation == .portrait) ? (gap - 1) : gap)
        case 80:
          gate.translateBy(x: 0, y: 15)
        case 120:
          gate.translateBy(x: 0, y: 52)
        case 200:
          gate.translateBy(x: 0, y: (orientation == .portrait) ? 48 : 40)
        case 300:
          gate.translateBy(x: 0, y: (orientation == .portrait) ? 50 : 48)
        case 400:
          gate.translateBy(x: 0, y: 6)
        default: ()
        }
        
        gate.setStrokeColor(#colorLiteral(red: 0.8238154054, green: 0.8188886046, blue: 0.8286994696, alpha: 1).cgColor)
        gate.setLineWidth(1)
        gate.addLines(between: [[7, 0], [margin, 0]])
        gate.strokePath()
        
        if unit > 40 && unit < 300 {
          attributes = [.font: UIFont.boldSystemFont(ofSize: 14), .foregroundColor: UIColor.black, .paragraphStyle: style]
        } else {
          attributes = [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: GraphViewStyle.placeholder.color, .paragraphStyle: style]
        }
        
        let text = "\(unit)" as NSString
        let size = text.size(withAttributes: attributes)
        text.draw(at: [margin + 5, -size.height/2], withAttributes: attributes)
      }
    }
  }
}
