//
//  GraphViewController.swift
//  GraphView
//
//  Created by Julio Montoya on 9/19/20.
//  Copyright © 2020 Julio Montoya. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

public class GraphViewController: NiblessViewController {
  
  // MARK: - Views
  private let graphContainer: GraphContainer = {
    let container = GraphContainer(orientation: .landscape)
    container.backgroundColor = .white
    return container
  }()
  
//  // MARK: - Orientation Properties
//  public override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation { .landscapeLeft }
//  public override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .allButUpsideDown }
//  public override var shouldAutorotate: Bool { true }
//
//  // MARK: - Properties
//  private var timerBag: DisposeBag? = DisposeBag()
//  private let disposeBag = DisposeBag()
//
  private let userInteractions: UserInteractions
  private let state: GraphState

  // MARK: - Life Cycle
  public init(state: GraphState, userInteractions: UserInteractions) {
    self.userInteractions = userInteractions
    self.state = state
    self.userInteractions.setTappableItemModeAvailable()
    super.init()
  }
//
//  public override func viewDidLoad() {
//    super.viewDidLoad()
//    constructBindings()
//    constructGraphViewContainer()
//    constructGraph()
//    constructStyles()
//  }
//
//  public override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    subscribeToStore()
//    constructDummyStates()
//  }
//
//  public override func viewWillDisappear(_ animated: Bool) {
//    super.viewWillDisappear(animated)
//    unsubscribeFromStore()
//    timerBag = nil
//  }
//
  // MARK: - Initializers
  private func constructGraphViewContainer() {
    view.insertAndLayout(view: graphContainer, constraints: [
      graphContainer.topAnchor.constraint(equalTo: view.topAnchor),
      graphContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      graphContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      graphContainer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
    ])
  }
//
//  private func constructDummyStates() {
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//      self.userInteractions.setLimitedModeAvailable()
//    }
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
//      self.userInteractions.setManualModeAvailable()
//    }
//
//    DispatchQueue.main.asyncAfter(deadline: .now() + 9) {
//      self.userInteractions.setAutomatedModeAvailable()
//    }

//    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//      self.userInteractions.setTappableItemModeAvailable()
//    }
//  }
//
//  private func constructBindings() {
//    NotificationCenter.default.rx
//      .notification(UIDevice.orientationDidChangeNotification)
//      .map { _ in UIDevice.current.orientation.isPortrait }
//      .subscribe(onNext: { [weak self] isPortrait in
//        guard isPortrait else { return }
//        self?.dismissController()
//      })
//      .disposed(by: disposeBag)
//  }
//
//  private func constructStyles() {
//    view.backgroundColor = .white
//  }
//
//  // MARK: - Store
//  private func subscribeToStore() {
//    store.subscribe(self)
//  }
//
//  private func unsubscribeFromStore() {
//    store.unsubscribe(self)
//  }
//
//  // MARK: - Graph State
//  private func updateGraph(state: GraphState) {
//    graphContainer.updateState(state: state)
//  }
//
//  private func constructGraph() {
//    updateGraph(state: state)
//  }
//
//  // MARK: - Actions
//  private func dismissController() {
//    dismiss(animated: true, completion: nil)
//  }
}
//
// MARK: - Factories
extension GraphViewController {
  public static func makeRootController(state: GraphState, userInteractions: UserInteractions) -> GraphViewController {
    let graphController = GraphViewController(state: state, userInteractions: userInteractions)
    graphController.modalPresentationStyle = .fullScreen
    graphController.modalTransitionStyle = .crossDissolve
    return graphController
  }
}
//
//// MARK:  - StoreSubscriber
//extension GraphViewController: StoreSubscriber {
//  public func newState(state: StateType) {
//    guard let state = (state as? GraphState) else { return }
//    graphContainer.updateState(state: state)
//  }
//}
