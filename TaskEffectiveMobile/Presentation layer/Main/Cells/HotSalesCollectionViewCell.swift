//
//  HotSalesCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit


class HotSalesCollectionViewCell: UICollectionViewCell {
    
    
    
    
    
    
    
    
    
    private let HotSalesBackgroundView: UIImageView = {
        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFill
        imageView.contentMode = .scaleToFill
//        ImageView.image = UIImage(named: "categoryBurger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let saleIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.image = UIImage(named: "Rect")
        imageView.backgroundColor = AppColors.orange
        imageView.layer.cornerRadius = 16
        return imageView
    }()
    
    
    private let productBigTitle: UILabel = {
        let label = UILabel()
        label.text = "Iphone 12"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = AppColors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let saleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColors.white
        button.setTitle("Buy Now", for: .normal)
        button.setTitleColor(AppColors.black, for: .normal)
        button.layer.cornerRadius = 5
        return button
        
    }()

    private let productSmallTitle: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = AppColors.white
        label.font = UIFont.systemFont(ofSize: 13)
        label.text = "super mega rapido"
        return label
    }()
    
    
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        backgroundColor = .white
        layer.cornerRadius = 10
        addSubview(HotSalesBackgroundView)
        HotSalesBackgroundView.addSubview(saleButton)
        HotSalesBackgroundView.addSubview(productSmallTitle)
        HotSalesBackgroundView.addSubview(productBigTitle)
        HotSalesBackgroundView.addSubview(saleIcon)
        
        
  
//        addSubview(categoryLabel)
    }
    
    
    func configureCell(categoryName: String, imageName:String) {
       
        HotSalesBackgroundView.image = UIImage(named: imageName)
    }
    
    
    func setConstraints() {
       
        HotSalesBackgroundView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        saleIcon.snp.makeConstraints {
            $0.left.equalTo(HotSalesBackgroundView.snp.left).offset(24)
            $0.top.equalTo(HotSalesBackgroundView.snp.top).inset(14)
            $0.height.width.equalTo(32)
            

        }
        
        saleButton.snp.makeConstraints {
            $0.left.equalTo(HotSalesBackgroundView.snp.left).offset(32)
            $0.bottom.equalTo(HotSalesBackgroundView.snp.bottom).inset(34)
            $0.width.equalTo(98)
            $0.height.equalTo(23)

        }
        
        productSmallTitle.snp.makeConstraints {
            $0.left.equalTo(HotSalesBackgroundView.snp.left).offset(35)
            $0.bottom.equalTo(saleButton.snp.top).offset(-26)
//            $0.width.equalTo(98)
//            $0.height.equalTo(23)

        }
        
        productBigTitle.snp.makeConstraints {
            $0.left.equalTo(HotSalesBackgroundView.snp.left).offset(35)
            $0.bottom.equalTo(productSmallTitle.snp.top).offset(-5)
//            $0.width.equalTo(98)
//            $0.height.equalTo(23)

        }
        
        
    }
    
    
    
    
    
    
    
    
}

