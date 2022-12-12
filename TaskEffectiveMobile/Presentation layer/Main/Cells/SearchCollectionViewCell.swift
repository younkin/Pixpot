//
//  SearchCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit


class SearchCollectionViewCell: UICollectionViewCell {
    
    
    private let searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "iconSearch")
        return imageView
    }()
    
    private let search: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchTextField.backgroundColor = .white
        searchBar.layer.borderWidth = 2
        searchBar.layer.borderColor = .none
        searchBar.barTintColor = .white
        searchBar.searchTextField.borderStyle = .none
        searchBar.backgroundColor = AppColors.background
        searchBar.barTintColor = AppColors.background

        searchBar.backgroundColor = AppColors.background
        searchBar.backgroundImage = .none

        searchBar.layer.backgroundColor = AppColors.background.cgColor

        searchBar.layer.borderColor = AppColors.background.cgColor
     
        return searchBar
    }()

    

    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = AppColors.background
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupView() {
      
        addSubview(search)
        addSubview(searchImage)
    }
    
    
    func configureCell(imageName:String) {
        
//        searchView.image = UIImage(named: imageName)
    }
    
    
    func setConstraints() {
      
        search.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview().offset(32)
            $0.right.equalTo(searchImage.snp.left)
            $0.bottom.equalToSuperview()
        }
        
        searchImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.right.equalToSuperview().inset(40)
            
            $0.width.equalTo(40)
            $0.height.equalTo(40)
        
        }
        
    }
    
    
    
    
    
    
    
    
}


