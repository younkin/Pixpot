//
//  roundButton.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 13.12.22.
//

import UIKit

final class UIButtonRounded: UIButton {
    

    
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

    override init(frame: CGRect) {
        super.init(frame: frame)

       
//        backgroundColor = AppColors.orange
//        setTitleColor(AppColor.white, for: .normal)
//        titleLabel?.font = AppFont.markProFont(ofSize: 16, weight: .bold)
       
        
    }


    
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
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppColors.orange
   
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    
    
    override func layoutSubviews() {
        let size = min(layer.frame.width , layer.frame.height)
       layer.cornerRadius = size / 2
        layer.masksToBounds = true

       
    }
    
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
   
    
    override var isEnabled: Bool {
        willSet {
//            backgroundColor = AppColor.green.withAlphaComponent(newValue ? 1 : 0.3)
        }
    }
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.5,
            delay: 0,
                       usingSpringWithDamping: 0.2,
            initialSpringVelocity: 6,
            options: UIView.AnimationOptions.allowUserInteraction,
            animations: { () -> Void in
            self.titleText.textColor = AppColors.darkBlue
            self.backgroundColor = AppColors.black
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
            self.titleText.textColor = AppColors.white
            self.backgroundColor = AppColors.orange
                self.transform = CGAffineTransform.identity
            }) { (Bool) -> Void in
        }
        super.touchesEnded(touches, with: event)
    }

}

