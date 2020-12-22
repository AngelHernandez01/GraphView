//
//  GraphV.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/14/20.
//

import SwiftUI

private var container: GraphContainer = GraphContainer(orientation: .landscape)

struct GraphV: UIViewRepresentable {
    
    let store: Store
    let userInteractions: UserInteractions
    let isLandscape: Bool
    let graphValues: [Int]
    
    func makeUIView(context: Context) -> UIView {
        container = GraphContainer(orientation: isLandscape ? .landscape : .portrait)
        container.backgroundColor = .clear
        store.subscribe(self)
        
        if isLandscape {
            userInteractions.setTappableItemModeAvailable()
        } else {
            userInteractions.setAutomatedModeAvailable()
        }
        
        container.updateGraphItems(graphValues)
        return container
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
}

extension GraphV: StoreSubscriber {
    func newState(state: StateType) {
        guard let state = (state as? GraphState) else { return }
        container.updateState(state: state)
    }
}
