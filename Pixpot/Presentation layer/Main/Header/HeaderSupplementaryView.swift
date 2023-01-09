//
//  HeaderSupplementaryView.swift
//  Sarawan
//
//  Created by Евгений Юнкин on 23.12.22.
//

import UIKit
import SnapKit


class HeaderSupplementaryView: UICollectionReusableView {
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Каталог"
        label.textAlignment = .center
        label.font = AppFont.markProFont(ofSize: 22, weight: .medium)
        
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
        backgroundColor = AppColors.white
        addSubview(headerLabel)
    }
    
    func setConstraints() {
  
        headerLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview()
            $0.top.equalToSuperview()
        }
    
    }
   
}

