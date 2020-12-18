//
//  GraphContainer.swift
//  GraphView
//
//  Created by Julio Montoya on 9/20/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit

public class GraphContainer: NiblessView {

  // MARK: - Views
  private let placeholderView: PlaceholderView = {
    let placeholder = PlaceholderView()
    placeholder.backgroundColor = GraphViewStyle.placeholderView.color
    return placeholder
  }()
  
  private let bottomSideView: BottomSideView = {
    let bottomSideView = BottomSideView()
    bottomSideView.backgroundColor = .clear
    bottomSideView.isUserInteractionEnabled = true
    return bottomSideView
  }()
  
  private let rightSideView: RightSideView = {
    let sideBar = RightSideView()
    sideBar.backgroundColor = .clear
    return sideBar
  }()
  
  private let statusBarView: TopSideView = {
    let statusBar = TopSideView()
    statusBar.backgroundColor = .clear
    return statusBar
  }()
  
  private let graphView: GraphView = {
    let graph = GraphView()
    graph.backgroundColor = .clear
    return graph
  }()
  
  // MARK: - Properties
  public var orientation: GraphOrientation
  public let rangeState: TimeRangeState

  private var alertQueue = Queue<PopupAlertView>()
  private var alertItems: [AlertItem] = []
  private var placeholderIsActive = false
  
  // MARK: - Object Lifecycle
  public init(
    frame: CGRect = .zero,
    graphState: GraphViewStateType = .noData,
    orientation: GraphOrientation = .portrait,
    rangeState: TimeRangeState = .three
  ) {
    self.orientation = orientation
    self.rangeState = rangeState
    super.init(frame: frame)
    constructGestureRecognizers()
    setupStatusBar()
    setupBottomSideView()
    setupRightSideView()
    setupGraphView()
  }
    
//    MARK: - SOLO PROBANDO
    public func setBottomViewDelegate(delegate: GraphContainer) {
        bottomSideView.delegate = delegate
    }
    
  
  // MARK: - Initial Setup
  private func setupNoDataPlaceholder() {
    insertAndLayout(view: placeholderView, constraints: [
      placeholderView.topAnchor.constraint(equalTo: topAnchor),
      placeholderView.bottomAnchor.constraint(equalTo: bottomAnchor),
      placeholderView.leadingAnchor.constraint(equalTo: leadingAnchor),
      placeholderView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  private func setupBottomSideView() {
    let isPortrait = (orientation == .portrait)
    bottomSideView.delegate = self
    
    insertAndLayout(view: bottomSideView, constraints: [
      bottomSideView.heightAnchor.constraint(equalToConstant: isPortrait ? 30 : 95),
      bottomSideView.leadingAnchor.constraint(equalTo: leadingAnchor),
      bottomSideView.trailingAnchor.constraint(equalTo: trailingAnchor),
      bottomSideView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
    bottomSideView.setupOrientation(isPortrait: isPortrait)
  }
  
  private func setupRightSideView() {
    rightSideView.orientation = orientation
    let graphTopAnchor = (orientation == .landscape) ? statusBarView.bottomAnchor : topAnchor
    
    insertAndLayout(view: rightSideView, constraints: [
      rightSideView.widthAnchor.constraint(equalToConstant: 55),
      rightSideView.trailingAnchor.constraint(equalTo: trailingAnchor),
      rightSideView.topAnchor.constraint(equalTo: graphTopAnchor),
      rightSideView.bottomAnchor.constraint(equalTo: bottomSideView.topAnchor)
    ])
  }
  
  private func setupStatusBar() {
    guard orientation == .landscape else { return }
    
    insertAndLayout(view: statusBarView, constraints: [
      statusBarView.heightAnchor.constraint(equalToConstant: 70),
      statusBarView.leadingAnchor.constraint(equalTo: leadingAnchor),
      statusBarView.trailingAnchor.constraint(equalTo: trailingAnchor),
      statusBarView.topAnchor.constraint(equalTo: topAnchor)
    ])
  }
  
  private func setupGraphView() {
    let graphTopAnchor = (orientation == .landscape) ? statusBarView.bottomAnchor : topAnchor
    
    insertAndLayout(view: graphView, constraints: [
      graphView.leadingAnchor.constraint(equalTo: leadingAnchor),
      graphView.trailingAnchor.constraint(equalTo: rightSideView.leadingAnchor),
      graphView.topAnchor.constraint(equalTo: graphTopAnchor),
      graphView.bottomAnchor.constraint(equalTo: bottomSideView.topAnchor)
    ])
  }
  
  // MARK: - No Data Mode
  private func removeNoDataModeIfVisible() {
    if placeholderIsActive {
      placeholderView.removeFromSuperview()
      placeholderIsActive = false
    }
  }
  
  private func displayNoDataMode() {
    updateGraphViewElements(state: nil)
    
    guard orientation != .portrait else { return }
    placeholderIsActive = true
    setupNoDataPlaceholder()
    statusBarView.displayNoDataPlaceholder()
  }
  
  // MARK: - Graph Element States
  private func updateGraphStatusBarElements(state: GraphState) {
    statusBarView.cgmView.titleLabel.text = state.cgm

    if state.iob.first == "-" {
      statusBarView.iobView.titleLabel.text = state.iob
    } else {
      statusBarView.iobView.setIOBStyle(state.iob)
    }

    statusBarView.titleLabel.text = state.graphModeState.rawValue
    statusBarView.titleLabel.textColor = state.graphModeState.color
    statusBarView.cgmView.statusImage.isHidden = (state.cgm == "--")
  }

  private func updateGraphViewElements(state: GraphState?) {
    let stateIsAvailable = (state != nil)

    bottomSideView.setupEventsArea(stateIsAvailable ? state!.areas : [])
    bottomSideView.setupIconViews(stateIsAvailable ? state!.icons : [])
    bottomSideView.setupEvents(stateIsAvailable ? state!.events : [])
    graphView.setupItems(stateIsAvailable ? state!.items : [])
    alertItems = stateIsAvailable ? state!.alerts : []
  }
  
  // MARK: - Animations
  private func animatePresentation(
    alert: PopupAlertView,
    duration: TimeInterval = 0.4,
    shouldDisplay: Bool = true,
    completion: (() -> Void)? = nil
  ) {
    UIView.animate(withDuration: shouldDisplay ? duration : 0.2) {
      alert.alpha = shouldDisplay ? 1 : 0
    } completion: { _ in
      completion?()
    }
  }
  
  // MARK: - Gesture Recognizers
  private func constructGestureRecognizers() {
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(self.handlePinch(recognizer:)))
    addGestureRecognizer(pinchGesture)
    
    guard orientation == .landscape else { return }
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(recognizer:)))
    addGestureRecognizer(tapGesture)
  }
  
  @objc
  private func handlePinch(recognizer: UIPinchGestureRecognizer) {
    guard recognizer.state == .began || recognizer.state == .changed else { return }
    let selection = Int(round(recognizer.pinchDistance * 4 / bounds.width))
    
    guard let selectedState = TimeRangeState(rawValue: selection * 3) else { return }
    bottomSideView.setupTimeRangeState(selectedState)
  }
  
  @objc
  private func handleTap(recognizer: UIPinchGestureRecognizer) {
    bottomSideView.updateEventsVisibility()
    
    guard let popupAlert = alertQueue.dequeue() else { return }
    remove(alert: popupAlert)
  }
}

extension GraphContainer: BottomSideViewDelegate {
  
  // MARK: - Alerts
  private func presentAlert(items: [AlertItem], positionX: CGFloat) {
    guard let firstItem = items.first else { return }
    
    let alertWidth = PopupAlertView.alertViewWidth
    let adjustedWidth = CGFloat((alertWidth * items.count) / 2)
    let popupAlert = PopupAlertView(origin: CGPoint(x: positionX - adjustedWidth, y: bounds.midY - firstItem.bottomPadding), items: items)
    addSubview(popupAlert)
    
    animatePresentation(alert: popupAlert)
    alertQueue.enqueue(popupAlert)
  }
  
  private func remove(alert: PopupAlertView) {
    animatePresentation(alert: alert, shouldDisplay: false) {
      alert.removeFromSuperview()
    }
  }
  
  // MARK: - Touch Events
  public func didTappedEvent(identifier: String, positionX: CGFloat) {
    if let popupAlert = alertQueue.dequeue() {
      remove(alert: popupAlert)
    }
    
    let alerts = alertItems.filter { $0.belongTo == identifier }
    presentAlert(items: alerts, positionX: positionX)
  }
}

// MARK: - Public API
extension GraphContainer {
  
  /// Update Event Area in Graph
  /// - Parameter areas: Representation of the Event Area in the graph
  public func updateEventArea(_ areas: [AreaItem], alerts: [AlertItem]) {
    guard areas.count >= alerts.count else { fatalError("Alerts are mandatory for Events")}
    bottomSideView.setupEventsArea(areas)
    alertItems += alerts
  }
  
  /// Update Event in Graph
  /// - Parameter events: Representation of the Events in the graph
  public func updateEvents(_ events: [EventItem], alerts: [AlertItem]) {
    assert(events.count >= alerts.count)
    bottomSideView.setupEvents(events)
    alertItems += alerts
  }
  
  /// Update Event in Graph
  /// - Parameter icons: Representation of the Events in the graph
  public func updateIcons(_ icons: [IconItem], alerts: [AlertItem]) {
    //assert(icons.count >= alerts.count)
    bottomSideView.setupIconViews(icons)
    alertItems += alerts
  }
  
  /// Update Event in Graph
  /// - Parameter events: Representation of dots in the graph
  public func updateGraphItems(_ items: [Int]) {
    graphView.setupItems(items)
  }
  
  /// Update States and elements in Graph
  /// - Parameter state: Representation of the current state of the Graph
  public func updateState(state: GraphState) {
    guard state.graphModeState != .noData else {
      displayNoDataMode()
      return
    }

    removeNoDataModeIfVisible()

    updateGraphViewElements(state: state)
    updateGraphStatusBarElements(state: state)
  }
}
