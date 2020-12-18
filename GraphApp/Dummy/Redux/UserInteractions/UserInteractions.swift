//
//  UserInteractions.swift
//  Graph
//
//  Created by Julio Montoya on 11/6/20.
//

import Foundation

public struct UserInteractions {
  
  // MARK: - Properties
  private let actionDispatcher: ActionDispatcher
  
  private var randomItems: [Int] {
    Array(repeating: 0, count: Int.random(in: 10..<100))
  }
  
  // MARK: - Object Lifecycle
  public init(actionDispatcher: ActionDispatcher) {
    self.actionDispatcher = actionDispatcher
  }
  
  // MARK: - Actions
  public func setGraphNoDataAvailable() {
    let action = NoDataAvailable()
    actionDispatcher.dispatch(action)
  }
  
  public func setLimitedModeAvailable() {
    let area = AreaItem(eventAreaType: .manual, originX: 40, width: 540)
    let alert = AlertItem(time: "12:00 pm", description: "Manual Mode", belongTo: area.identifier)
    
    let area2 = AreaItem(eventAreaType: .limited, originX: area.width!, width: 200)
    let alert2 = AlertItem(time: "07:00 am", description: "Limited Mode", belongTo: area2.identifier)
    
    let action = SetLimitedMode(items: randomItems, alerts: [alert, alert2], areas: [area, area2], iob: "0.5 u")
    actionDispatcher.dispatch(action)
  }
  
  public func setManualModeAvailable() {
    let area = AreaItem(eventAreaType: .manual, originX: 40, width: 740)
    let alert = AlertItem(time: "12:00 pm", description: "Manual Mode", belongTo: area.identifier)

    let action = SetManualMode(items: randomItems, alerts: [alert], areas: [area], iob: "0.5 u")
    actionDispatcher.dispatch(action)
  }
  
  public func setAutomatedModeAvailable() {
    let area = AreaItem(eventAreaType: .automated, originX: 40, width: 740)
    let alert = AlertItem(time: "12:00 pm", description: "Automated Mode", belongTo: area.identifier)

    let action = SetAutomatedMode(items: randomItems, alerts: [alert], areas: [area])
    actionDispatcher.dispatch(action)
  }
  
  public func setTappableItemModeAvailable() {
    func makeEvents() -> ([EventItem], [AlertItem]) {
      let event = EventItem(eventType: .maximumBasal)
      let alert = AlertItem(time: "2:25 PM", description: "Insulin Max Reached", belongTo: event.identifier)
      
      
      let event2 = EventItem(eventType: .pausedInsulin)
      let secondAlert = AlertItem(time: "2:25 PM", description: "Last Bolus", belongTo: event2.identifier)
      let thirdAlert = AlertItem(time: "2:25 PM", description: "Last Bolus", belongTo: event2.identifier)
      
      return ([event, event2], [alert, secondAlert, thirdAlert])
    }

    func makeAreas() -> ([AreaItem], [AlertItem]) {
      let area = AreaItem(eventAreaType: .progress, originX: 0, width: 150)
      let alert = AlertItem(time: "2:25 PM", description: "Automated Limited", belongTo: area.identifier)
      
      let secondArea = AreaItem(eventAreaType: .limited, originX: 90, width: 300)
      let secondAlert = AlertItem(time: "2:25 PM", description: "Automated Limited", belongTo: secondArea.identifier)
      
      let thirdArea = AreaItem(eventAreaType: .manual, originX: 180, width: 200)
      let thirdAlert = AlertItem(time: "2:25 PM", description: "Automated Limited", belongTo: thirdArea.identifier)
      
      return ([area, secondArea, thirdArea], [alert, secondAlert, thirdAlert])
    }

    func makeIcons() -> ([IconItem], [AlertItem]) {
      let iconItem = IconItem(type: .bolus, badge: .check)
      let alert = AlertItem(isIcon: true, time: "2:25 PM", description: "Bolus:\n 2.25 Units", belongTo: iconItem.identifier)
      
      let SiconItem = IconItem(type: .pod, badge: .double)
      let Salert = AlertItem(isIcon: true, time: "2:25 PM", description: "Bolus:\n 2.25 Units", belongTo: SiconItem.identifier)
      let SsecondAlert = AlertItem(isIcon: true, time: "2:25 PM", description: "Bolus:\n 2.25 Units", belongTo: SiconItem.identifier)
      
      return ([iconItem, SiconItem], [alert, Salert, SsecondAlert])
    }

    let events = makeEvents()
    let areas = makeAreas()
    let icons = makeIcons()
    let alerts = events.1 + areas.1 + icons.1
    
    let action = SetTappableItemsMode(items: randomItems, events: events.0, areas: areas.0, icons: icons.0, alerts: alerts, cgm: "121", iob: "0.5 u")
    actionDispatcher.dispatch(action)
  }
}
