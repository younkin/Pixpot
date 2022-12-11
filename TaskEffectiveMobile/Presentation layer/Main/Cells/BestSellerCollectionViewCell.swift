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
//    private let backgroundTitleView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.alpha = 0.6
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    private let nameLabel: UILabel = {
//        let label = UILabel ()
//        label.text = "Egg Top Burber"
//        label.textAlignment = .center
//        label.font = UIFont (name: "Arial", size: 16)
//        label.textColor = .black
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
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
//        addSubview (backgroundTitleView)
//        addSubview (nameLabel)
//        addSubview (priceLabel)
    }
    
    func configureCell(imageName: String) {
//        burgerImageView.image = UIImage(named: imageName)
    }
    
    
    
    
    func setConstraints() {
        
        
        bestSellerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
    }
}

