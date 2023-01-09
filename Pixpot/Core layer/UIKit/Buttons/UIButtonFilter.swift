//
//  UIButtonFilter.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 18.12.22.
//


import UIKit

class UIButtonFilter: UIButton {
    
    var leftIcon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .clear
        icon.image = UIImage(named: "mapIcon")
        return icon
    }()
    var rightIcon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .clear
        icon.image = UIImage(named: "arrowDown")
        return icon
    }()
    
    var titleText: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = AppFont.markProFont(ofSize: 15, weight: .regular)
        label.textColor = AppColors.black
        return label
    }()
    
    init(titleText: String) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        self.titleText.text = titleText
        backgroundColor = AppColors.background
        addSubview(self.titleText)
        addSubview(self.leftIcon)
        addSubview(self.rightIcon)
        
        makeConstrates()
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func makeConstrates() {
        
        leftIcon.snp.makeConstraints {
            $0.right.equalTo(titleText.snp.left).offset(-5)
            $0.centerY.equalTo(titleText.snp.centerY)
            $0.height.equalTo(15)
            $0.width.equalTo(12)
        }
        titleText.snp.makeConstraints {
            
            $0.center.equalTo(self.snp.center)
            $0.height.equalTo(self.snp.height).multipliedBy(0.9)
        }
        rightIcon.snp.makeConstraints {
            $0.left.equalTo(titleText.snp.right).offset(5)
            $0.centerY.equalTo(titleText.snp.centerY)
           
            $0.height.equalTo(5)
            $0.width.equalTo(10)
        }
    }
    

    
  
}
