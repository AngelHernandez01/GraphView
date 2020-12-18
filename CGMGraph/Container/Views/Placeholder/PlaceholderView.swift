//
//  PlaceholderView.swift
//  Graph
//
//  Created by Julio Montoya on 11/3/20.
//

import UIKit

public class PlaceholderView: NiblessView {
  
  // MARK: - Views
  private let noDataLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 24, weight: .bold)
    label.textColor = GraphViewStyle.dexcom.color
    label.text = "No Data Available"
    return label
  }()
  
  // MARK: - Object Lifecycle
  public override init(frame: CGRect) {
    super.init(frame: frame)
    layoutNoDataLabel()
  }
  
  // MARK: - Layouts
  private func layoutNoDataLabel() {
    insertAndLayout(view: noDataLabel, constraints: [
      noDataLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      noDataLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }
}
