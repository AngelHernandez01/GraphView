//
//  StatusBarView.swift
//  Graph
//
//  Created by Julio Montoya on 11/3/20.
//

import UIKit

public class TopSideView: NiblessView {
  
  // MARK: - Views
  private lazy var horizontalStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [cgmView, iobView])
    stackView.distribution = .fill
    stackView.axis = .horizontal
    stackView.alignment = .fill
    stackView.spacing = 40
    return stackView
  }()
  
  public lazy var cgmView: StatusViewItem = {
    let statusView = makeStatusView(type: .cgm)
    return statusView
  }()
  
  public lazy var iobView: StatusViewItem = {
    let statusView = makeStatusView(type: .iob)
    //statusView.setIOBStyle()
    return statusView
  }()
  
  private let dexcomLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 13, weight: .semibold)
    label.textColor = GraphViewStyle.placeholder.color
    label.text = "Dexcom CGM"
    return label
  }()
  
  public let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 26)
    label.textColor = GraphViewStyle.statusTitle.color
    label.text = "Automated"
    return label
  }()
  
  // MARK: - Object Lifecycle
  public override init(frame: CGRect) {
    super.init(frame: frame)
    layoutTitleLabel()
    layoutDexcomLabel()
    layoutHorizontalStackView()
  }
  
  // MARK: - Layouts
  private func layoutTitleLabel() {
    insertAndLayout(view: titleLabel, constraints: [
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30)
    ])
  }
  
  private func layoutDexcomLabel() {
    insertAndLayout(view: dexcomLabel, constraints: [
      dexcomLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      dexcomLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }
  
  private func layoutHorizontalStackView() {
    insertAndLayout(view: horizontalStackView, constraints: [
      horizontalStackView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20),
      horizontalStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
  
  // MARK: - Placeholder
  public func displayNoDataPlaceholder() {
    iobView.titleLabel.text = "--"
    cgmView.titleLabel.text = "--"
    cgmView.statusImage.isHidden = true
    titleLabel.text = "--"
  }
}

// MARK: - Factories
extension TopSideView {
  public func makeStatusView(type: StatusViewItemType) -> StatusViewItem {
    let statusView = StatusViewItem(type: type)
    statusView.widthAnchor.constraint(equalToConstant: 100).isActive = true
    statusView.heightAnchor.constraint(equalToConstant: 55).isActive = true
    return statusView
  }
}
