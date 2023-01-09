//
//  DetailsControl.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 16.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class DetailsControl: UIControl {
    
    private lazy var labels = [UILabel]()
    private lazy var simpleView: UIImageView = {
        var image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LineProduct")
        image.contentMode = .bottom
        return image
    }()
    
   lazy var items: [String] = ["Shop", "Details", "Features"] {
        didSet {
            if items.count > 0 {
                setLabels()
            }
        }
    }
    
    private(set) lazy var selectedIndex: Int = 0 {
        didSet {
            showNewSelectedIndex()
        }
    }
    
    private lazy var selectedLabelColor: UIColor = AppColors.darkBlue //{
    
    private lazy var unselectedLabelColor: UIColor = AppColors.black.withAlphaComponent(0.5) 

    private lazy var selectedLabelFont: UIFont = AppFont.markProFont(ofSize: 20, weight: .bold)
    
    private lazy var unselectedLabelFont: UIFont = AppFont.markProFont(ofSize: 20, weight: .regular)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        translatesAutoresizingMaskIntoConstraints = false 
        setView()
    }
    
   private func setView() {

       backgroundColor = .clear
        setLabels()
        insertSubview(simpleView, at: 0)
    }

    func setLabels() {
        for label in labels {
            label.removeFromSuperview()
        }

        labels.removeAll(keepingCapacity: true)

        for index in 1...items.count {
            let label = UILabel(frame: CGRect.zero)
            label.text = items[index - 1]
            label.textAlignment = .center
            
            label.textColor = index == 1 ? selectedLabelColor : unselectedLabelColor
            
            label.backgroundColor = .clear
            
            label.font = index == 1 ? selectedLabelFont : unselectedLabelFont
            
            label.translatesAutoresizingMaskIntoConstraints = false
            
            self.addSubview(label)
            labels.append(label)
        }
        
        addIndividualItemConstraints(labels, mainView: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        if labels.count > 0 {
            let label = labels[selectedIndex]
            label.textColor = selectedLabelColor
            simpleView.frame = label.frame
            simpleView.backgroundColor = .clear
            
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
        for (_, item) in labels.enumerated() {
            item.textColor = unselectedLabelColor
            item.font = unselectedLabelFont
        }

        let label = labels[selectedIndex]
        label.textColor = selectedLabelColor
        label.font = selectedLabelFont

        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.8, animations: {
            self.simpleView.frame = label.frame
        }, completion: nil)
    }
    
    func addIndividualItemConstraints(_ items: [UIView], mainView: UIView) {
        
        for (index, button) in items.enumerated() {
            
            button.snp.makeConstraints {
                $0.top.equalTo(self)
                $0.bottom.equalTo(self)
            }
            
            if index == 0 {
                button.snp.makeConstraints {
                    $0.leading.equalTo(self)
                }
            } else {
                    let prevButton: UIView = items[index - 1]
                    let firstItem: UIView = items[0]
                    button.snp.makeConstraints {
                        $0.leading.equalTo(prevButton.snp.trailing).offset(40)
                        $0.height.equalTo(firstItem.snp.height)
                    }
                }

                if index == items.count - 1 {
                    button.snp.makeConstraints {
                            $0.trailing.equalTo(self)
                        }
                    } else {
                    let nextButton: UIView = items[index + 1]
                    button.snp.makeConstraints {
                        $0.trailing.equalTo(nextButton.snp.leading).offset(-45)
                    }
                }
            }
        }
    
}
