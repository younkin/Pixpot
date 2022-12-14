//
//  BestSellerCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit
import SDWebImage



class BestSellerCollectionViewCell: UICollectionViewCell {
    
    let stackView = UIStackView()
    
    private let bestSellerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.image = UIImage (named: "iphone-13")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    private var isFavoriteIcon: UIButton = {
        let icon = UIButtonRounded(icon: UIImage(named: "heartDisable"))
        icon.layer.shadowColor = AppColors.black.cgColor
        icon.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        icon.layer.shadowOpacity = 2.0
        icon.layer.shadowRadius = 4.0
        icon.layer.masksToBounds = false
        icon.layer.cornerRadius = 10.0
        return icon
    }()
    
    private let productDiscription: UILabel = {
        let label = UILabel ()
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size: 10)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountedPrice: UILabel = {
        let label = UILabel ()
        label.textAlignment = .center
        label.font = AppFont.markProFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let fullPrice: UILabel = {
        let label = UILabel ()
        label.textAlignment = .left
        label.font = AppFont.markProFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.alpha = 0.8
        return label
    }()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        self.isUserInteractionEnabled = true
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = AppColors.white
        addSubview (bestSellerImage)
        bestSellerImage.isUserInteractionEnabled = true
        bestSellerImage.addSubview(isFavoriteIcon)
        addSubview (productDiscription)
        addSubview(stackView)
        stackView.addArrangedSubview(discountedPrice)
        stackView.addArrangedSubview(fullPrice)
    }
    
    func configureCell(imageName: String, fullPrice: Int, priceWithDiscount: Int, title: String, isFavorite: Bool) {
        self.bestSellerImage.sd_setImage(with: URL(string: imageName))
        self.fullPrice.text = String(fullPrice)
        self.discountedPrice.text = String(priceWithDiscount)
        self.fullPrice.attributedText = String(fullPrice).strikeThrough()
        self.productDiscription.text = title
        self.isFavoriteIcon.isSelected = isFavorite
    }
    
    func setConstraints() {
        
        bestSellerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(stackView.snp.top)
        }
        
        stackView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(productDiscription.snp.top)
            $0.height.equalTo(20)
        }
        
        discountedPrice.snp.makeConstraints {
            $0.bottom.equalTo(stackView.snp.bottom)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalToSuperview()
            $0.width.equalTo(40)
        }
        fullPrice.snp.makeConstraints {
            $0.left.equalTo(discountedPrice.snp.right).offset(2)
            $0.bottom.equalTo(stackView.snp.bottom)
            $0.height.equalToSuperview().multipliedBy(0.8)
            $0.width.equalTo(40)
        }

        productDiscription.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(30)
        }
        
        isFavoriteIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.right.equalToSuperview().inset(12)
            $0.width.height.equalTo(25)
        }
        
    }
}

