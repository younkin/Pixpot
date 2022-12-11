//
//  RoundedImageView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit


class RoundedImageView: UIView {
    
    private var iconImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private var roundImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    required init(color: UIColor, iconImage: String) {
        super.init(frame: .zero)
        self.roundImage.backgroundColor = color
        self.iconImage.image = UIImage(named: iconImage)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           self.layer.cornerRadius = self.frame.size.height / 2
           self.clipsToBounds = true
       }
    
    
    
    func commonInit() {
        addSubview(roundImage)
        roundImage.addSubview(iconImage)
        
        
        roundImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        iconImage.snp.makeConstraints {
            $0.center.equalTo(roundImage.snp.center)
            $0.width.height.equalToSuperview().multipliedBy(0.5)
        }
        
        
        
    }

}
