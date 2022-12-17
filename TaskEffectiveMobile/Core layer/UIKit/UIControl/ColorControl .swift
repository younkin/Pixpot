//
//  ColorControl.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 16.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class ColorControl: UIControl {
    
   private(set) lazy var imageViews = [UIImageView]()
    
   lazy var items: [UIColor] = [AppColors.darkBlue, AppColors.orange] {
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

   private func setView() {
       translatesAutoresizingMaskIntoConstraints = false
       backgroundColor = .clear
       setImageViews()
    }
    
    func setImageViews() {
        for view in imageViews {
            view.removeFromSuperview()
        }
        imageViews.removeAll(keepingCapacity: true)
        for index in 1...items.count {
            let imageView = UIImageView(frame: CGRect.zero)
            imageView.backgroundColor = items[index-1]
            imageView.contentMode = .center
            imageView.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview(imageView)
            imageViews.append(imageView)
        }
        addIndividualItemConstraints(imageViews, mainView: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageViews.count > 0 {
            let imageView = imageViews[selectedIndex]
            imageView.image = UIImage(named: "ColorYes")!
            imageView.backgroundColor = items[selectedIndex].withAlphaComponent(0.7)
            imageViews.map { color in
                color.layer.cornerRadius = color.frame.height / 2
            }
            showNewSelectedIndex()
        }
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)

        var calculatedIndex: Int?
        for (index, item) in imageViews.enumerated() {
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
        for (index, item) in imageViews.enumerated() {
            item.backgroundColor = items[index]
            item.image = .none
        }
        let imageView = imageViews[selectedIndex]
        imageView.backgroundColor = items[selectedIndex].withAlphaComponent(0.7)
        imageView.image = UIImage(named: "ColorYes")!
    }
    
    private func addIndividualItemConstraints(_ items: [UIImageView], mainView: UIView) {
        for (index, color) in items.enumerated() {
            color.snp.makeConstraints {
                $0.height.equalTo(self.snp.height)
                $0.width.equalTo(self.snp.height)
            }
            if index == 0 {
                color.snp.makeConstraints {
                    $0.leading.equalTo(self)
                }
            }
            else {
                    let preImageView = imageViews[index-1]
                color.snp.makeConstraints {
                    $0.leading.equalTo(preImageView.snp.trailing).offset(15)
                }
            }
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}


