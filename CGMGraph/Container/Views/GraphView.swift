//
//  GraphView.swift
//  GraphView
//
//  Created by Julio Montoya on 9/2/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

public class GraphView: NiblessView {
  
  // MARK: - Inputs
  private var items: [Int] = []
  
  // MARK: - Properties
  private var columnWidth: CGFloat {
    return (bounds.width - 10) / CGFloat(items.count)
  }

  private var middleFrame: CGRect {
    return CGRect(x: bounds.origin.x, y: bounds.midY - 8, width: bounds.width, height: barHeight)
  }

  private var gap: CGFloat {
    return bounds.height / (ySections + 1)
  }
  
  private let barHeight: CGFloat = 70
  private let ySections: CGFloat = 5
    
  
  // MARK: - Object Lifecycle
  public override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { fatalError() }
    drawHorizontalLines(context: context)
    drawMiddleBar(context: context, rect: rect)
    drawPoints(context: context, rect: rect)
  }
  
  // MARK: - Drawings
  private func drawMiddleBar(context: CGContext, rect: CGRect) {
    func makeTopBar() {
      let frame = CGRect(x: 0, y: middleFrame.origin.y, width: rect.width, height: 1)
      makeBezierPathBar(in: frame, graphColor: .topBar)
    }
    
    func makeMiddleBar() {
      makeBezierPathBar(in: middleFrame, graphColor: .middleBar)
    }
    
    func makeBottomBar() {
      let bottomFrame = CGRect(x: 0, y: middleFrame.origin.y + middleFrame.height, width: rect.width, height: 1)
      makeBezierPathBar(in: bottomFrame, graphColor: .bottomBar)
    }
    
    func makeDashedLine() {
      let padding: CGFloat = 45
      let p0 = CGPoint(x: bounds.minX, y: bounds.midY + padding)
      context.move(to: p0)
      
      let p1 = CGPoint(x: bounds.maxX, y: bounds.midY + padding)
      context.addLine(to: p1)
    
      let dashes: [CGFloat] = [10, 2.0]
      context.setLineDash(phase: 0.0, lengths: dashes)
      context.setLineWidth(1.0)
      context.setLineCap(.butt)
      GraphViewStyle.dashedLine.color.set()
      context.strokePath()
    }
    
    makeMiddleBar()
    makeBottomBar()
    makeTopBar()
    makeDashedLine()
  }
  
  private func drawPoints(context: CGContext, rect: CGRect) {
    for i in 0..<items.count {
      let isLastItem = (i == items.count - 1)
      
      let middleSize = max(3, min(8, columnWidth/2))
      let middleFilterSize = isLastItem ? middleSize + 3 : middleSize
//      let filterHeight = rect.midY + (isLastItem ? 20 : 21)
        let filterHeight = (bounds.height / 360) * CGFloat(items[i])
      let rect = CGRect(x: columnWidth * CGFloat(i) + 10, y: filterHeight, width: middleFilterSize, height: middleFilterSize)
      //let rect = CGRect(x: columnWidth * CGFloat(i) + 10, y: CGFloat.random(in: (rect.midY - 40)..<(rect.midY + 40)), width: middleSize, height: middleSize)
      
      let path = UIBezierPath(ovalIn: rect)
      UIColor.black.setFill()
      path.fill()
      
      guard isLastItem else { continue }
        
      let newRect = CGRect(x: rect.origin.x + 1.5, y: rect.origin.y + 1.5, width: rect.width - 3, height: rect.height - 3)
      let innerPath = UIBezierPath(ovalIn: newRect)
      UIColor.white.setFill()
      innerPath.fill()
    }
  }
  
  private func drawHorizontalLines(context: CGContext) {
    let font = UIFont.systemFont(ofSize: 11)
    let attributes = [NSAttributedString.Key.font: font]
    
    context.restoreGate { gate in
      for index in 1...5 {
        
        switch index {
        case 1:
          gate.translateBy(x: 0, y: 6)
        case 2:
          gate.translateBy(x: 0, y: gap + 13)
        case 3:
          gate.translateBy(x: 0, y: gap + 10)
        case 4:
          gate.translateBy(x: 0, y: gap)
        case 5:
          gate.translateBy(x: 0, y: gap + 25)
        default: ()
        }
        
        gate.setStrokeColor(#colorLiteral(red: 0.8238154054, green: 0.8188886046, blue: 0.8286994696, alpha: 1).cgColor)
        gate.setLineWidth(1)
        gate.addLines(between: [.zero, [bounds.width, 0]])
        gate.strokePath()
        
        let text = "" as NSString
        let size = text.size(withAttributes: attributes)
        text.draw(at: [6, -size.height/2], withAttributes: attributes)
      }
    }
  }
}

// MARK: - Public API
extension GraphView {
  public func setupItems(_ items: [Int]) {
    self.items = items
    setNeedsDisplay()
  }
}

// MARK: - Factories
extension GraphView {
  private func makeBezierPathBar(in rect: CGRect, graphColor: GraphViewStyle) {
    let topBar = UIBezierPath(rect: rect)
    graphColor.color.setFill()
    topBar.fill()
  }
}
