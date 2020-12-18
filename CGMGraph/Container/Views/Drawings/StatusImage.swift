//
//  StatusImage.swift
//  Graph
//
//  Created by Julio Montoya on 10/5/20.
//

import UIKit

public class StatusImage: NiblessView {
  
  // MARK: - Object Lifecycle
  public override func draw(_ rect: CGRect) {
    let path = UIBezierPath(ovalIn: rect)
    GraphViewStyle.rightArrow.color.setFill()
    path.fill()
    
    let horizontalPadding: CGFloat = rect.width / 7
    
    print(rect.width / 7)
    
    let arrowPath =  UIBezierPath()
    arrowPath.move(to: [rect.minX + horizontalPadding, rect.midY])
    arrowPath.addLine(to: [horizontalPadding * 6, rect.midY])
    arrowPath.addLine(to: [horizontalPadding * 4, horizontalPadding * 5])
    arrowPath.move(to: [horizontalPadding * 6, rect.midY])
    arrowPath.addLine(to: [horizontalPadding * 4, horizontalPadding * 2])
    arrowPath.lineWidth = rect.width / 15
    arrowPath.lineCapStyle = .round
    arrowPath.lineJoinStyle = .round
    UIColor.white.setStroke()
    arrowPath.stroke()
  }
}
