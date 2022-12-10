//
//  HeaderSupplementaryView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit


class HeaderSupplementaryView: UICollectionReusableView {
    
    

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
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
        addSubview(headerLabel)
    }
    
    
    func configureHeader(categoryname:String) {
        
        headerLabel.text = categoryname
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
      
        ])
    }
    
    
    
    
    
    
    
    
}

