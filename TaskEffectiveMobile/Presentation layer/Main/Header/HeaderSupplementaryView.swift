//
//  HeaderSupplementaryView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit
import SnapKit


class HeaderSupplementaryView: UICollectionReusableView {
    
    private lazy var viewAllButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitleColor(AppColors.buttonOrange, for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        
      
        return button
    }()

    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.textColor = AppColors.black
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
        backgroundColor = AppColors.background
        addSubview(headerLabel)
        addSubview(viewAllButton)
    }
    
    
    func configureHeader(categoryname:String , buttonTitle: String) {
        
        headerLabel.text = categoryname
        viewAllButton.setTitle(buttonTitle, for: .normal)
    }
    
    
    func setConstraints() {
        
        
        headerLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview()
        }
        
        
        viewAllButton.snp.makeConstraints {
            $0.right.equalToSuperview().inset(20)
            $0.height.equalTo(19)
            $0.width.equalTo(70)
            $0.bottom.equalToSuperview()
            
        }
//        NSLayoutConstraint.activate([
//            headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
//            headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//
//            viewAllButton.centerYAnchor.constraint(equalTo: centerYAnchor),
//            viewAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10)
//
//
//        ])
        
        
        
    }
    
    
    
    
    
    
    
    
}

