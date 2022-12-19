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
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.backgroundColor = AppColors.background
        return collectionView
    }()
    
    private(set) lazy var infoView =  ProductInfoView()
    
    var product = ProductEntitie()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = AppColors.background
        
        setDelegates()
        setupUI()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    private func createLayout() -> UICollectionViewLayout {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.6),
                heightDimension: .fractionalHeight(1.0))
         let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .groupPaging
            section.contentInsets = .init(top: 5, leading: 70, bottom: 5, trailing: 70)
            section.interGroupSpacing = 33
            let layout = UICollectionViewCompositionalLayout(section: section)
            return layout
        }

    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
    private func setupUI() {
        addSubview(screenNameLbl)
        addSubview(backButton)
        addSubview(basketButton)
        addSubview(collectionView)
        addSubview(infoView)
        
        screenNameLbl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButton.snp.centerY)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(self).offset(21)
            $0.width.height.equalTo(37)
        }
        
        basketButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(10)
            $0.trailing.equalTo(self).inset(21)
            $0.width.height.equalTo(37)
        }
        
        collectionView.snp.makeConstraints {
           // $0.top.equalTo(safeAreaLayoutGuide).offset(50)
            $0.leading.trailing.equalTo(self)
           // $0.height.equalTo(300)
            $0.top.equalTo( backButton.snp.bottom).offset(30)
            $0.bottom.equalTo(infoView.snp.top).offset(-7)
        }
        
        infoView.snp.makeConstraints {
            //$0.top.equalTo(collectionView.snp.bottom).offset(7)
            $0.left.equalToSuperview().offset(7)
            $0.right.equalToSuperview().offset(-7)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-15)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProductView: UICollectionViewDelegate {
    
}

extension ProductView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.images.count    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? ProductCollectionViewCell else { return UICollectionViewCell() }
        
        cell.shadowDecorate()
        cell.setupCell(url: product.images[indexPath.row])
        return cell
    }
    
}

