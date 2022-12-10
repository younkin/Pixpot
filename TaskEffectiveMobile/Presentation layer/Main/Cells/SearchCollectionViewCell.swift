//
//  SearchCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit


class SearchCollectionViewCell: UICollectionViewCell {
    
    
    private let searchView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
//    private let search: UISearchController = {
//        let searchBar = UISearchController()
//
//
//    }()
//
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
        addSubview(searchView)
    }
    
    
    func configureCell(imageName:String) {
        
        searchView.image = UIImage(named: imageName)
    }
    
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            searchView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            searchView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            searchView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    
    
    
    
    
    
    
}


