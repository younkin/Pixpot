//
//  SizeButton.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 20.12.2022.
//

import UIKit

final class SizeButton: UIButton {
    
     init() {
        super.init(frame: .zero)
        
        self.backgroundColor = AppColors.white
        self.setTitle("4.5 to 5.5 inches", for: .normal)
        self.titleLabel?.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).offset(15)
            $0.width.equalTo(150)
        }
        self.setTitleColor(AppColors.darkBlue, for: .normal)
        self.setImage(UIImage(named: "FilterDrop"), for: .normal)
        self.imageView?.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.trailing.equalTo(self).inset(15)
            $0.width.equalTo(16)
            $0.height.equalTo(8)
        }
        //self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = min(self.frame.width, self.frame.height)
        self.layer.cornerRadius = size / 7
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColors.grey.withAlphaComponent(0.1).cgColor
    }
}
