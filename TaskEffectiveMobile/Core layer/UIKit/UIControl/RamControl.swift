//
//  RamControl.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 16.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class RamControl: UIControl {
    
    private(set) lazy var labels = [UILabel]()
     
    lazy var items: [String] = ["128", "256"] {
        didSet {
            setImageViews()
        }
    }
     
    private(set) lazy var selectedIndex: Int = 0 {
         didSet {
             showNewSelectedIndex()
         }
     }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
   private func setView() {

       translatesAutoresizingMaskIntoConstraints = false
       backgroundColor = .clear
       setImageViews()
    }
    
    func setImageViews() {
        
        for label in labels {
            label.removeFromSuperview()
        }
        labels.removeAll(keepingCapacity: true)

        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.font = AppFont.markProFont(ofSize: 13, weight: .bold)
            label.textColor = AppColors.grey
            label.backgroundColor = .clear
            label.textAlignment = .center
            label.layer.masksToBounds = true
            label.text = items[index-1]
            self.addSubview(label)
            labels.append(label)
        }
        addIndividualItemConstraints(labels, mainView: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if labels.count > 0 {
            let label = labels[selectedIndex]
            label.backgroundColor = AppColors.orange
            label.textColor = AppColors.white
            labels.map { label in
                label.layer.cornerRadius = label.frame.height / 3
                print(label.frame.height)
            }
            showNewSelectedIndex()
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)

        var calculatedIndex: Int?
        for (index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        if calculatedIndex != nil {
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        return false
    }
    
    func showNewSelectedIndex() {
        for (index, item) in labels.enumerated() {
            item.backgroundColor = .clear
            item.textColor = AppColors.grey
        }

        let label = labels[selectedIndex]
        label.backgroundColor = AppColors.orange
        label.textColor = AppColors.white
    }

    private func addIndividualItemConstraints(_ items: [UILabel], mainView: UIView) {
        
        for (index, label) in items.enumerated() {
            label.snp.makeConstraints {
                $0.top.equalTo(self)
                $0.bottom.equalTo(self)
                $0.width.equalTo(70)
            }
            
            if index == 0 {
                label.snp.makeConstraints {
                    $0.leading.equalTo(self)
                }
            } else {
                let preLabel: UILabel = items[index-1]
                label.snp.makeConstraints {
                    $0.leading.equalTo(preLabel.snp.trailing).offset(15)
                }
            }
        }
    }
}
