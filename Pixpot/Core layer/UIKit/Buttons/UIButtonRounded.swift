//
//  roundButton.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 13.12.22.
//

import UIKit

class UIButtonRounded: UIButton {
    
    var icon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .clear
        return icon
    }()
    
    var titleText: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = AppFont.markProFont(ofSize: 20, weight: .bold)
        label.textColor = AppColors.white
        return label
    }()
    
    init(icon: UIImage?) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.icon.image = icon
        backgroundColor = AppColors.orange
        addSubview(self.icon)
        makeIconConstrate()
    }
    
    init(title: String?) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.titleText.text = title
        backgroundColor = AppColors.orange
        addSubview(self.titleText)
        makeTitleConstrate()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func layoutSubviews() {
        let size = min(layer.frame.width , layer.frame.height)
        layer.cornerRadius = size / 2
        layer.masksToBounds = true
    }
    
    
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.icon.image = UIImage(named: "heartActive")
                self.backgroundColor = AppColors.white
            } else {
                self.icon.image = UIImage(named: "heartDisable")
                self.backgroundColor = AppColors.white
            }
        }
    }
    
    
    
    
}
//MARK: Animation
extension UIButtonRounded {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 6,
                       options: UIView.AnimationOptions.allowUserInteraction,
                       animations: { () -> Void in
            self.titleText.textColor = AppColors.darkBlue
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



//MARK: Constraints
extension UIButtonRounded {
    
    
    func makeIconConstrate() {
        icon.snp.makeConstraints {
            $0.center.equalTo(self.snp.center)
            $0.size.equalTo(self.snp.size).multipliedBy(0.5)
        }
    }
    
    func makeTitleConstrate() {
        titleText.snp.makeConstraints {
            $0.center.equalTo(self.snp.center)
            $0.size.equalTo(self.snp.size).multipliedBy(0.8)
        }
    }
    
}
