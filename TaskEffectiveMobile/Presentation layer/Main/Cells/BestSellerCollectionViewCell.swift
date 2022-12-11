//
//  BestSellerCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit
class BestSellerCollectionViewCell: UICollectionViewCell {
    
    
    private let bestSellerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage (named: "iphone-13")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var onSaleImage: RoundedImageView = {
        let image = RoundedImageView(color: AppColors.orange, iconImage: "heartSelect")
        return image
    }()
//    private let backgroundTitleView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.alpha = 0.6
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    private let productDiscription: UILabel = {
        let label = UILabel ()
        label.text = "Sumsung note 20 Ultra"
        label.textAlignment = .center
        label.font = UIFont (name: "Arial", size: 10)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountedPrice: UILabel = {
        let label = UILabel ()
        label.text = "$400"
        label.textAlignment = .center
        label.font = UIFont (name: "Arial", size: 16)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fullPrice: UILabel = {
        let label = UILabel ()
        label.text = "$1500"
        label.textAlignment = .center
        label.font = UIFont (name: "Arial", size: 10)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
//    private let priceLabel: UILabel = {
//        let label = UILabel ()
//        label.text = "$7.42"
//        label.textAlignment = .center
//        label.font = UIFont (name: "Arial Bold", size: 24)
//        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview (bestSellerImage)
        bestSellerImage.addSubview(onSaleImage)
        addSubview (productDiscription)
        addSubview (discountedPrice)
        addSubview (fullPrice)
    }
    
    func configureCell(imageName: String) {
//        burgerImageView.image = UIImage(named: imageName)
    }
    
    
    
    
    func setConstraints() {
        
        
        bestSellerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(fullPrice.snp.top)
        }
        
        discountedPrice.snp.makeConstraints {
            $0.left.equalToSuperview().offset(21)
            $0.right.equalTo(fullPrice.snp.left)
            $0.bottom.equalTo(productDiscription.snp.top)
            $0.height.equalTo(30)
            
         
        }
        fullPrice.snp.makeConstraints {
//            $0.left.equalTo(fullPrice.snp.right)
            $0.right.equalToSuperview()
            $0.bottom.equalTo(productDiscription.snp.top)
            $0.height.equalTo(30)
          
        }
        
        productDiscription.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(30)
        }
        
        onSaleImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.right.equalToSuperview().inset(12)
            $0.width.height.equalTo(25)
//            $0.right.equalToSuperview()
//            $0.bottom.equalToSuperview()
        }
        
    }
}

