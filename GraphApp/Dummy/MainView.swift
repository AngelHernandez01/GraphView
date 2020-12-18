//
//  MainView.swift
//  GraphApp
//
//  Created by Angel Hernández on 12/15/20.
//

import SwiftUI

let store = Store(reducer: graphReducer, state: nil)
private let userInteraction = UserInteractions(actionDispatcher: store)
private let graphValues = ValueGenerator
    .generateOrderedIntValues(
        bottomLimit: 70,
        topLimit: 350,
        numberOfItems: 100
)

struct MainView: View {
    @StateObject var model: Model
    
    var body: some View {
        NavigationView {
            Group {
                if model.landscape {
                    GraphV(
                        store: store,
                        userInteractions: userInteraction,
                        isLandscape: model.landscape,
                        graphValues: graphValues
                    )
                } else {
                    VStack {
                        if !model.landscape {
                            Text("IOB 0.5 Units")
                                .modifier(SubTitleTextView())

                            Text("Last Bolus 6.05 Units")
                                .modifier(SubTitleTextView())
                            HStack {
                                Text("Feb 10 (7:23 pm)")
                                Spacer()
                            }
                            .padding([.leading, .bottom], 20)
                            HStack {
                                Text("121")
                                    .modifier(GlucoseTextView())
                                Image("Arrow")
                                Spacer()
                            }
                            Text("mg/dL")
                                .modifier(SubTitleTextView())
                                .padding([.top], -20)
                        }
                        
                        GraphV(
                            store: store,
                            userInteractions: userInteraction,
                            isLandscape: model.landscape,
                            graphValues: graphValues
                        )
                    }
                }
            }
        }
        .navigationTitle(Text("Manual"))
    }
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(model: Model(isLandscape: UIDevice.current.orientation.isLandscape))
    }
}
