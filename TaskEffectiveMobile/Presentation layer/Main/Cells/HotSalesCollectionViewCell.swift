//
//  HotSalesCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit
import SDWebImage


class HotSalesCollectionViewCell: UICollectionViewCell {
    
    private let HotSalesBackgroundView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let saleIcon: UIButton = {
        let button = UIButtonRounded(title: "New")
        return button
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
    
    let saleButton: UIButton = {
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
    // MARK: - Init
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = min(HotSalesBackgroundView.layer.frame.width , HotSalesBackgroundView.layer.frame.height)
        HotSalesBackgroundView.layer.cornerRadius = size / 10
        HotSalesBackgroundView.layer.masksToBounds = true
    }
    
    func setupView() {
        backgroundColor = AppColors.background
        layer.cornerRadius = 10
        addSubview(HotSalesBackgroundView)
        HotSalesBackgroundView.isUserInteractionEnabled = true
        HotSalesBackgroundView.addSubview(saleButton)
        HotSalesBackgroundView.addSubview(productSmallTitle)
        HotSalesBackgroundView.addSubview(productBigTitle)
        HotSalesBackgroundView.addSubview(saleIcon)
    }

    func configureCell(title: String,
                       subtitle: String,
                       image:String,
                       isNew: Bool,
                       IsBuy : Bool,
                       id: Int) {
        
        HotSalesBackgroundView.sd_setImage(with: URL(string: image))
        self.productSmallTitle.text = subtitle
        self.productBigTitle.text = title
        
        if isNew {
            saleIcon.isHidden = false
        } else {
            saleIcon.isHidden = true
        }
        
        if id == 2 {self.productBigTitle.text = ""}
    }
//MARK: Constraints
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
            $0.height.width.equalTo(27)
        }
        productBigTitle.snp.makeConstraints {
            $0.left.equalTo(HotSalesBackgroundView.snp.left).offset(24)
            $0.bottom.equalTo(productSmallTitle.snp.top).offset(-5)
        }
        productSmallTitle.snp.makeConstraints {
            $0.left.equalTo(HotSalesBackgroundView.snp.left).offset(24)
            $0.bottom.equalTo(saleButton.snp.top).offset(-17)
        }
        saleButton.snp.makeConstraints {
            $0.left.equalTo(HotSalesBackgroundView.snp.left).offset(24)
            $0.bottom.equalTo(HotSalesBackgroundView.snp.bottom).inset(30)
            $0.width.equalTo(98)
            $0.height.equalTo(23)
        }
    }
}

