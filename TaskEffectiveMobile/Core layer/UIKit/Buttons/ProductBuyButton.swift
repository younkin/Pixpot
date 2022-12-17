//
//  ProductBuyButton.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 16.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class ProductBuyButton: UIButton {
    
    private lazy var title1: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.white
        label.font = AppFont.markProFont(ofSize: 20, weight: .bold)
        label.text = "Add to Cart"
        return label
    }()
    
     lazy var title2: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = AppColors.white
        label.font = AppFont.markProFont(ofSize: 20, weight: .bold)
        label.text = "$1,500.00"
        return label
    }()
    
    
    
    init() {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = AppColors.orange
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let size = min(layer.frame.width , layer.frame.height)
        layer.cornerRadius = size / 5
        layer.masksToBounds = true
    }
    
    private func setupUI() {
        addSubview(title1)
        addSubview(title2)
        
        title1.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).offset(25)
        }
        
        title2.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.trailing.equalTo(self).inset(25)
        }
    }
}
