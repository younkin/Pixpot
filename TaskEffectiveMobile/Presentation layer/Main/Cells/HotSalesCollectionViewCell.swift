//
//  HotSalesCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit


class HotSalesCollectionViewCell: UICollectionViewCell {
    
    
    
    
    
    
    
    
    
    private let categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
//        ImageView.image = UIImage(named: "categoryBurger")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Category"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(categoryImageView)
        addSubview(categoryLabel)
    }
    
    
    func configureCell(categoryName: String, imageName:String) {
        categoryLabel.text = categoryName
        categoryImageView.image = UIImage(named: imageName)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([

            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            categoryLabel.heightAnchor.constraint(equalToConstant: 16),
            
            
            categoryImageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            categoryImageView.bottomAnchor.constraint(equalTo: categoryLabel.topAnchor, constant: 0)
            
            
            
        ])
    }
    
    
    
    
    
    
    
    
}

