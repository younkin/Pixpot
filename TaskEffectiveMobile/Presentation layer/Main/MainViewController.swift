//
//  MainView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

class MainViewController: UIViewController {
    
    private let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
    private let sections = MockData.shared.pageData
    
   
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setDelegates()
        setupViews()
        setConstraints()
    }
    
    
    private func setupViews() {
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = AppColors.background
        title = "Shop"
        view.addSubview(collectionView)
        collectionView.register(SelectCollectionViewCell.self, forCellWithReuseIdentifier: "StoriesCollectionViewCell")
        collectionView.register(HotSalesCollectionViewCell.self, forCellWithReuseIdentifier: "PopelarCollectionViewCell")
        collectionView.register(BestSellerCollectionViewCell.self, forCellWithReuseIdentifier: "ComingSoonCollectionViewCell")
        collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "SearchCollectionViewCell")
        
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
    
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }


}
//MARK: Create Layout

extension MainViewController {
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else {return nil}
            let section = self.sections[sectionIndex]
            switch section {

            case .selectCategory(_):
                return self.createSaleSection()
            case .search(_):
                return self.createSearchSection()
            case .hotSales(_):
                return self.createHotSalesSection()
            case .bestSellers(_):
                return self.createBestSellersSection()
            }
       
            
        }
    }
    
    private func createlayoutSection(group: NSCollectionLayoutGroup,
                                     behavior: UICollectionLayoutSectionOrthogonalScrollingBehavior,
                                     interGroupSpacing: CGFloat,
                                     supplementaryItem: [NSCollectionLayoutBoundarySupplementaryItem]) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = behavior
        section.interGroupSpacing = interGroupSpacing
        section.boundarySupplementaryItems = supplementaryItem
     return section
        
    }
    
    
    private func createSaleSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25),
                                                            heightDimension: .fractionalHeight(1)))
   
        item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
     
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.15)),
                                                                          subitems: [item])
//        group.interItemSpacing = .fixed(10)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = createlayoutSection(group: group,
                                          behavior: .continuousGroupLeadingBoundary,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [supplementaryHeaderItem()])
        
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        
        return section
    }
    
    
    private func createSearchSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .absolute(70)),
                                                                          subitems: [item])
        
        let section = createlayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [])
        
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        
        return section
    }
    
    
    
    
    
    private func createHotSalesSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.25)),
                                                                          subitems: [item])
        
        let section = createlayoutSection(group: group,
                                          behavior: .groupPaging,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [supplementaryHeaderItem()]
                                        )
        
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        
        return section
    }
    
    
    private func createBestSellersSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
       
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.3)),
                                                                          subitems: [item])
//        group.interItemSpacing = .flexible(1)
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = createlayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [supplementaryHeaderItem()]
                                        )
        
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        
        
        return section
    }
    
    
    
    
    
    
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
    
}

//MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
    
}


//MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].count
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
            
        case .selectCategory(let sale):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoriesCollectionViewCell", for: indexPath) as? SelectCollectionViewCell
            
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(titleName: sale[indexPath.row].title, iconLink: sale[indexPath.row].image)
           
            return cell
            
            
        case .search(let search):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell
            
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: search[indexPath.row].image)
            return cell
            
            
            
        case .hotSales(let category):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopelarCollectionViewCell", for: indexPath) as? HotSalesCollectionViewCell
            
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(categoryName: category[indexPath.row].title, imageName: category[indexPath.row].image)

            return cell
            
            
        case .bestSellers(let example):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingSoonCollectionViewCell", for: indexPath) as? BestSellerCollectionViewCell
            
            else {
                return UICollectionViewCell()
            }
            cell.configureCell(imageName: example[indexPath.row].image)
            return cell
            
            
  
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as! HeaderSupplementaryView
            
            
            header.configureHeader(categoryname: sections[indexPath.section].title, buttonTitle: "see more")
            
            
            
            return header
        default:
            return UICollectionReusableView()
        }
        
        
    }
    
}


//MARK: -  Set Constraints


extension MainViewController {
    
    
    private func setConstraints() {
        NSLayoutConstraint.activate([

        
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
            
            
        
        ])
        
    }
}

