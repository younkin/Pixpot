//
//  HeartProdButton.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 17.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class HeartButton: UIButton {
    
    var icon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .clear
        return icon
    }()
    init() {
    super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.icon.image = UIImage(named: "heartDisable")
        backgroundColor = AppColors.darkBlue
        icon.tintColor = AppColors.orange
        addSubview(self.icon)
        makeIconConstrate()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = min(frame.height, frame.width) /  4
        layer.masksToBounds = true 
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeIconConstrate() {
        icon.snp.makeConstraints {
            $0.center.equalTo(self.snp.center)
            $0.size.equalTo(self.snp.size).multipliedBy(0.5)
        }
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.icon.image = UIImage(named: "heartActive")
                self.backgroundColor = AppColors.darkBlue
            } else {
                self.icon.image = UIImage(named: "HeartWhite")
                self.backgroundColor = AppColors.darkBlue
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6,
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: { () -> Void in
            self.backgroundColor = AppColors.orange
            self.transform = CGAffineTransform.identity
        }) { (Bool) -> Void in
        }
        super.touchesEnded(touches, with: event)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6.0,
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: { () -> Void in
            self.isSelected = !self.isSelected
            print(self.isSelected)
            self.transform = CGAffineTransform.identity
        }) { (Bool) -> Void in
        }
        super.touchesEnded(touches, with: event)
    }
}
