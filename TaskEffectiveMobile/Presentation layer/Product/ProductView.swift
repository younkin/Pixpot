//
//  ProductView.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 14.12.2022.
//

import Foundation
import UIKit
import SDWebImage
import SnapKit

final class ProductView: UIView {

    private lazy var screenNameLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .scaleAspectFill
        label.text = "Product Details"
        label.font = AppFont.markProFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    private(set) lazy var backButton = RoundedNavButton(image: UIImage(named: "BasketBack")!, color: AppColors.darkBlue)
    private(set) lazy var basketButton = RoundedNavButton(image: UIImage(named: "busket")!, color: AppColors.orange)
    
    private lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        return collectionView
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = AppColors.white
        
        setDelegates()
        setupUI()
    }
    
    private func setupUI() {
        addSubview(screenNameLbl)
        addSubview(backButton)
        addSubview(basketButton)
        addSubview(collectionView)
        
        screenNameLbl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButton.snp.centerY)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(29)
            $0.leading.equalTo(self).offset(21)
            $0.width.height.equalTo(37)
        }
        
        basketButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(29)
            $0.trailing.equalTo(self).inset(21)
            $0.width.height.equalTo(37)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(146)
            $0.leading.trailing.equalTo(self)
            $0.height.equalTo(349)
        }
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductView: UICollectionViewDelegate {
    
}

extension ProductView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}
