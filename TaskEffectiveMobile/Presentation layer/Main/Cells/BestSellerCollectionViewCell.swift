//
//  BestSellerCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit
class BestSellerCollectionViewCell: UICollectionViewCell {
    
    
    private let burgerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage (named: "burger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private let backgroundTitleView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.alpha = 0.6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let nameLabel: UILabel = {
        let label = UILabel ()
        label.text = "Egg Top Burber"
        label.textAlignment = .center
        label.font = UIFont (name: "Arial", size: 16)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let priceLabel: UILabel = {
        let label = UILabel ()
        label.text = "$7.42"
        label.textAlignment = .center
        label.font = UIFont (name: "Arial Bold", size: 24)
        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
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
        clipsToBounds = true
        layer.cornerRadius = 10
        
        addSubview (burgerImageView)
        addSubview (backgroundTitleView)
        addSubview (nameLabel)
        addSubview (priceLabel)
    }
    
    func configureCell(imageName: String) {
        burgerImageView.image = UIImage(named: imageName)
    }
    
    
    
    
    func setConstraints() {
        
        
        NSLayoutConstraint.activate([
            burgerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            burgerImageView.leadingAnchor.constraint(equalTo:leadingAnchor,constant:8),
            burgerImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            burgerImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            
            
            backgroundTitleView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            backgroundTitleView.leadingAnchor.constraint(equalTo:leadingAnchor,constant:0),
            backgroundTitleView.trailingAnchor.constraint(equalTo:trailingAnchor,constant:0),
            backgroundTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            
            nameLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: backgroundTitleView.leadingAnchor, constant: 10),
            
            priceLabel.centerYAnchor.constraint(equalTo: backgroundTitleView.centerYAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: backgroundTitleView.trailingAnchor, constant: -10),
        ])
    }
}

