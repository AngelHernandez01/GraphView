//
//  Model.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/16/20.
//

import RxSwift
import SwiftUI

class Model: ObservableObject {
    @Published var landscape: Bool = false
    private var lastState: GraphState?
    private let disposeBag = DisposeBag()
    
    init(isLandscape: Bool) {
        self.landscape = isLandscape
        NotificationCenter.default.rx
            .notification(UIDevice.orientationDidChangeNotification)
            .map { _ -> Bool in
                return UIDevice.current.orientation.isValidInterfaceOrientation
            }
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] isLandscape in
                guard isLandscape, let self = self else { return }
                self.changeOrientationStatus()
            })
            .disposed(by: disposeBag)
    }
    
    private func changeOrientationStatus() {
        landscape = UIDevice.current.orientation.isLandscape
    }
}

