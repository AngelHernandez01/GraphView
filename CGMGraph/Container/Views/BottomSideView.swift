//
//  BottomBar.swift
//  GraphView
//
//  Created by Julio Montoya on 9/22/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

public class BottomSideView: NiblessView {
  
  // MARK: - Inputs
  private var timeRangeState: TimeRangeState = .three
  private var isPortrait: Bool = true
  
  // MARK: - Properties
  public weak var delegate: BottomSideViewDelegate?
  private var eventViews: [EventView] = []
  private var eventAreas: [EventArea] = []
  private var iconViews: [IconView] = []
  
  // MARK: - Object Lifecycle
  public override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  public override func draw(_ rect: CGRect) {
    guard let context = UIGraphicsGetCurrentContext() else { fatalError() }
    drawBottomTextColumn(context: context)
  }
  
  // MARK: - Drawings
  private func drawBottomTextColumn(context: CGContext) {
    let font = UIFont.systemFont(ofSize: 11)
    var attributes: [NSAttributedString.Key: Any] = [.font: font]
    var indexCount = 0
    
    let style = NSMutableParagraphStyle()
    style.alignment = NSTextAlignment.center
    
    context.restoreGate { [weak self] gate in
      guard let self = self else { return }
      let availableTimes = self.timeRangeState.availableTime().map { $0 as NSString }
      let rightSideBarWidth: CGFloat = 55
      let leftGap: CGFloat = 60
      let finalGap: CGFloat = rightSideBarWidth + leftGap
      
      availableTimes.forEach { text in
        let gapping = (bounds.width - finalGap) / (CGFloat(availableTimes.count) - 1)
        
        switch indexCount {
        case 0:
          gate.translateBy(x: 60, y: 0)
        case 1:
          gate.translateBy(x: gapping, y: 0)
        case 2:
          gate.translateBy(x: gapping, y: 0)
        case 3:
          gate.translateBy(x: gapping, y: 0)
        default: break
        }
        
        indexCount += 1
        
        gate.setStrokeColor(UIColor.black.cgColor)
        gate.setLineWidth(1)
        gate.addLines(between: [[0, bounds.height - 27], [0, bounds.height - 30]])
        gate.strokePath()
        
        if text == "Now" {
          attributes = [.font: UIFont.boldSystemFont(ofSize: 13), .foregroundColor: UIColor.black]
        }
        
        let size = text.size(withAttributes: attributes)
        text.draw(at: [-size.width/2, bounds.height - 20], withAttributes: attributes)
      }
    }
  }
  
  // MARK: - Events
  private func updateEventArea(_ areas: [AreaItem]) {
    removeChildren(&eventAreas)
    
    var origin: CGFloat = 0
    
    for area in areas {
      let width = area.width ?? bounds.width
      let frame = CGRect(x: origin, y: 37, width: width, height: 25)
      let eventArea = EventArea(frame: frame, eventAreaType: area.eventAreaType, identifier: area.identifier)
      setupViewEvent(array: &eventAreas, view: eventArea, zIndex: .bottom)
      
      if let newOrigin = self.convertCoordinateSystem(from: eventArea) {
        origin = newOrigin.maxX
      }
    }
  }
  
  private func updateEvents(_ events: [EventItem]) {
    removeChildren(&eventViews)
    
    for (index, event) in events.enumerated() {
      let origin = CGPoint(x: (100 * 2) * (index + 1), y: event.height)
      let frame = CGRect(origin: origin, size: event.size)
      let eventView = EventView(frame: frame, eventType: event.eventType, identifier: event.identifier)
      setupViewEvent(array: &eventViews, view: eventView, zIndex: .top)
    }
  }
  
  private func updateIconViews(_ icons: [IconItem]) {
    removeChildren(&iconViews)
    
    for (index, icon) in icons.enumerated() {
      let origin = CGPoint(x: (100 * 2) * (index + 1), y: 0)
      let frame = CGRect(origin: origin, size: CGSize(width: 35, height: 35))
      let iconView = IconView(frame: frame, type: icon.type, badge: icon.badge, identifier: icon.identifier)
      setupViewEvent(array: &iconViews, view: iconView, zIndex: .top)
    }
  }
  
  // MARK: - Event Visibility
  private func updateEventAreasVisibility(identifier: String = .none, restoreAlpha: Bool = false) {
    updateVisibility(array: eventAreas, identifier: identifier, restoreAlpha: restoreAlpha)
  }
  
  private func updateEventViewsVisibility(identifier: String = .none, restoreAlpha: Bool = false) {
    updateVisibility(array: eventViews, identifier: identifier, restoreAlpha: restoreAlpha)
  }
  
  private func updateIconViewsVisibility(identifier: String = .none, restoreAlpha: Bool = false) {
    updateVisibility(array: iconViews, identifier: identifier, restoreAlpha: restoreAlpha)
  }
  
  // MARK: - Gesture Recognizer
  @objc
  private func handleEventTap(recognizer: UITapGestureRecognizer) {
    switch recognizer.view {
    case let eventView as EventView:
      didReceiveTapEvent(
        type: .event,
        identifier: eventView.identifier,
        originX: eventView.center.x
      )
    case let eventArea as EventArea:
      didReceiveTapEvent(
        type: .area,
        identifier: eventArea.identifier,
        originX: eventArea.center.x
      )
    case let iconView as IconView:
      didReceiveTapEvent(
        type: .icon,
        identifier: iconView.identifier,
        originX: iconView.center.x
      )
    default:
      break
    }
  }
  
  private func makeEventViewTappable(_ eventView: UIView) {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleEventTap(recognizer:)))
    eventView.addGestureRecognizer(tapGesture)
  }
}

// MARK: - Reusable Generics
extension BottomSideView {
  private func updateVisibility<T: UIView & EventIdentifier>(array: [T], identifier: String, restoreAlpha: Bool) {
    array.forEach { eventView in
      let isTagEqualOrRestoreView = (eventView.identifier != identifier && !restoreAlpha)
      eventView.alpha = isTagEqualOrRestoreView ? 0.4 : 1
    }
  }
  
  private func setupViewEvent<T: UIView & EventIdentifier>(array: inout [T], view: T, zIndex: zIndex) {
    insertSubview(view, at: zIndex.rawValue)
    array.append(view)
    makeEventViewTappable(view)
  }
  
  private func didReceiveTapEvent(type: ItemType, identifier: String, originX: CGFloat) {
    guard let delegate = delegate else { fatalError("BottomSideViewDelegate is not implemented") }
  
    updateEventViewsVisibility(identifier: (type == .event) ? identifier : "void")
    updateEventAreasVisibility(identifier: (type == .area) ? identifier : "void")
    updateIconViewsVisibility(identifier: (type == .icon) ? identifier : "void")
    
    delegate.didTappedEvent(identifier: identifier, positionX: originX)
  }
  
  private func removeChildren<T: UIView & EventIdentifier>(_ array: inout [T]) {
    array.forEach { $0.removeFromSuperview() }
    array.removeAll()
  }
}

// MARK: - Public API
extension BottomSideView {
  public func setupTimeRangeState(_ timeRangeState: TimeRangeState ) {
    self.timeRangeState = timeRangeState
    setNeedsDisplay()
  }
  
  public func setupEventsArea(_ eventAreas: [AreaItem]) {
    guard !isPortrait else { return }
    updateEventArea(eventAreas)
  }
  
  public func setupEvents(_ eventItems: [EventItem]) {
    guard !isPortrait else { return }
    updateEvents(eventItems)
  }
  
  public func setupIconViews(_ iconViews: [IconItem]) {
    guard !isPortrait else { return }
    updateIconViews(iconViews)
  }
  
  public func setupOrientation(isPortrait: Bool) {
    self.isPortrait = isPortrait
    setNeedsDisplay()
  }
  
  public func updateEventsVisibility() {
    updateEventViewsVisibility(restoreAlpha: true)
    updateEventAreasVisibility(restoreAlpha: true)
    updateIconViewsVisibility(restoreAlpha: true)
  }
}
