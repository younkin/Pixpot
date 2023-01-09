//
//  ProductCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 15.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class ProductCollectionViewCell: UICollectionViewCell {
    
    private lazy var imageView: UIImageView = {
       var iamgeView = UIImageView()
        iamgeView.translatesAutoresizingMaskIntoConstraints = false
        iamgeView.contentMode = .scaleAspectFit
        return iamgeView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = AppColors.white
        
        setupUI()
    }
    
    func setupCell(url: String) {
        imageView.sd_setImage(with: URL(string: url))
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension UICollectionViewCell {
    func shadowDecorate() {
        let size = min(frame.width , frame.height)
        let radius: CGFloat = size / 14
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.clear.cgColor
        contentView.layer.masksToBounds = true
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.3
        layer.masksToBounds = false
        layer.cornerRadius = radius
    }
}
