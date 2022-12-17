//
//  MainView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 14.12.22.
//

import UIKit



final class MainView: UIView {
    //MARK: outlets
    var mainData: MainEntitie?
    let stackView = UIStackView()
    private let sections = MockData.shared.pageData
    
    let filterButtontext: UIButtonFilter = {
        let button = UIButtonFilter(titleText: "Zihuatanejo, Gro")

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "filterIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
  
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .none
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    // MARK: - Init
    init() {
        super.init(frame: .zero)
        setDelegates()
        setupViews()
        setConstraints()
        registerCells()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
    
    private func setupViews() {
        backgroundColor = AppColors.background
        stackView.axis = .horizontal
        stackView.alignment = .center
        addSubview(stackView)
        stackView.addArrangedSubview(filterButtontext)
        stackView.addArrangedSubview(filterButton)
        addSubview(collectionView)
    }
    
    private func registerCells() {
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

extension MainView {
    private func createLayout() -> UICollectionViewCompositionalLayout  {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else {return nil}
            let section = self.sections[sectionIndex]
            switch section {
            case .selectCategory(_):
                return self.createSalectSection()
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

    private func createSalectSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.25),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 10, bottom: 10, trailing: 10)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.9),
                                                                         heightDimension: .fractionalHeight(0.15)),
                                                       subitems: [item])
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = createlayoutSection(group: group,
                                          behavior: .continuousGroupLeadingBoundary,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 0)
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
                                          supplementaryItem: [supplementaryHeaderItem()])
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
        group.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = createlayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [supplementaryHeaderItem()])
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
extension MainView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.section)
        print(indexPath.row)
        
        if indexPath.section == 3 {
            //переход на детали самсунга
        }
        
    }
    
}
//MARK: - UICollectionViewDataSource
extension MainView: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return sections[section].count
        case 1:
            return sections[section].count
        case 2:
            return mainData?.homeStore.count ?? 0
        case 3:
            return mainData?.bestSeller.count ?? 0
        default:
            return 0
        }
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
            
            
            
        case .hotSales(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopelarCollectionViewCell", for: indexPath) as? HotSalesCollectionViewCell
                    
            else {
                return UICollectionViewCell()
            }
            guard let data = self.mainData?.homeStore[indexPath.row] else { return UICollectionViewCell() }
            
            
            cell.configureCell(title: data.title, subtitle: data.subtitle, image: data.picture, isNew: data.isNew ?? false, IsBuy: data.isBuy, id: data.id)
            return cell
            
            
        case .bestSellers(_):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComingSoonCollectionViewCell", for: indexPath) as? BestSellerCollectionViewCell
                    
            else {
                return UICollectionViewCell()
            }
            //            mainData?.bestSeller[0].
            guard let data = self.mainData?.bestSeller[indexPath.row] else { return UICollectionViewCell() }
            
            cell.configureCell(imageName: data.picture, fullPrice: data.priceWithoutDiscount, priceWithDiscount: data.priceWithoutDiscount, title: data.title, isFavorite: data.isFavorites)
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


extension MainView {
    private func setConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(self.snp.top).offset(50)
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
            $0.height.equalTo(30)
        }

        collectionView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom)
            $0.left.equalTo(self.snp.left)
            $0.right.equalTo(self.snp.right)
            $0.bottom.equalTo(self.snp.bottom)
        }
        
        filterButton.snp.makeConstraints {
            $0.center.equalTo(stackView.snp.center)
            $0.right.equalTo(self.snp.right).offset(-30)
            $0.height.width.equalTo(stackView.snp.height).multipliedBy(0.9)
        }
  
        filterButtontext.snp.makeConstraints {
            $0.center.equalTo(stackView.snp.center)
            $0.height.equalTo(stackView.snp.height)
            $0.width.equalTo(stackView.contentScaleFactor)
        }
    }
}
