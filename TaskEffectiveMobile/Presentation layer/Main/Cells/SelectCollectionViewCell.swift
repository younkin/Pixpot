//
//  SelectCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit


class SelectCollectionViewCell: UICollectionViewCell {
    
    
    private let saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool {
        didSet{
            if isSelected {
                layer.borderWidth = 2
                layer.borderColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
            } else {
                layer.borderWidth = 0
            }
        }
    }
    
    
    func setupView() {
        backgroundColor = .white
        addSubview(saleImageView)
    }
    
    
    func configureCell(imageName:String) {
        
        saleImageView.image = UIImage(named: imageName)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            saleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            saleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            saleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            saleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    
    
    
    
    
    
    
}

