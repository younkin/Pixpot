//
//  CategoryFoodView.swift
//  Sarawan
//
//  Created by MAC on 04.11.2021.
//

import UIKit
import Combine


final class mainCategoryView: UIView {

    
   private var localData = MockData.shared.pageData //временно пока нету фотографий с бэка

    private let viewModel: mainCategoryViewModel
    var canceballe = Set<AnyCancellable>()
    
    private let customBar: UICustomBar = {
        let bar = UICustomBar()
        bar.configure(title: "Find all sports \n near you", imageName: "PixtopLogo")
        return bar
    }()
    
    // MARK: - Outlets
    let collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = AppColors.darkBlue
        collectionView.bounces = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()


//    let filterButton = FilterButton()
    private let activityIndicator = UIActivityIndicatorView(style: .large)

    // MARK: - Properties


    var cancelablle: AnyCancellable?
//    var didTapCell: ((ProductModel)->Void)?

    // MARK: - Init
    init(viewModel: mainCategoryViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        addSubview(collectionView)
        addSubview(activityIndicator)
        
        registerCells()
        setDelegates()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        configureUI()
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    
    private func registerCells() {
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: "HeaderCollectionViewCell")
        collectionView.register(ProductsCollectionViewCell.self, forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        collectionView.register(FooterSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "FooterSupplementaryView")
        collectionView.register(HeaderSupplementaryView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderSupplementaryView")
        collectionView.collectionViewLayout = createLayout()
    }
}

extension mainCategoryView {
    private func createLayout() -> UICollectionViewCompositionalLayout  {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else {return nil}
            switch sectionIndex {
            case 0:
                return self.createHeadSection()
            case 1:
                return self.createProductSection()
            default:
                return nil
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
    
    private func createHeadSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.25)),
                                                       subitems: [item])
        group.contentInsets = .init(top: 16, leading: 10, bottom: 0, trailing: 10)
        let section = createlayoutSection(group: group,
                                          behavior: .groupPagingCentered,
                                          interGroupSpacing: 5,
                                          supplementaryItem: [supplementaryFooterItem(),supplementaryHeaderItem()])
        
        
        section.visibleItemsInvalidationHandler = { (items, offset, env) -> Void in

           
            self.viewModel.pageIndicator.send(items.last?.indexPath.row ?? 0)
            
        
        }

        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func createProductSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5),
                                                            heightDimension: .fractionalHeight(1)))
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                                         heightDimension: .fractionalHeight(0.17)),
                                                       subitems: [item])
        group.contentInsets = .init(top: 0, leading: 10, bottom: 0, trailing: 10)
        let section = createlayoutSection(group: group,
                                          behavior: .none,
                                          interGroupSpacing: 0,
                                          supplementaryItem: [supplementaryHeaderItem()])
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func supplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
    }
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(30)),
              elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
    }
}


// MARK: - Public API
extension mainCategoryView {

    func removeTextTextField() {
   
    }

    func removeMainFoodTextFieldFirstResponder() {

    }

    func startingActivityIndicator() {
        activityIndicator.startAnimating()
    }

    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
    }

    func isHiddenCollectionView(isLoadingIndicator: Bool) {
        if isLoadingIndicator {
            collectionView.alpha = 0
        } else {
            collectionView.alpha = 1
        }
    }
}

 //MARK: - UICollectionViewDelegate
extension mainCategoryView: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 1 {
//            collectionView.deselectItem(at: indexPath, animated: false)
//            let categoryFoodModel = categories[indexPath.row]
//              delegate?.collectionView(didSelect: .productsPopular(catalogFoodModel: categoryFoodModel))
          
        }
        
        
    }
}

//MARK: - UICollectionViewDataSource
extension mainCategoryView: UICollectionViewDataSource {
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return localData[0].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as? HeaderCollectionViewCell
                    
            else {
                return UICollectionViewCell()
            }
            let image = self.localData[0].items[indexPath.row].imageBig
               cell.configureCell(imageString: image)
            
            return cell
            
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as? ProductsCollectionViewCell
                    
            else {
                return UICollectionViewCell()
            }
//            let name = self.sections[indexPath.section].items[indexPath.row].title
            let name = ""
                let image = self.localData[0].items[indexPath.row].imageSmall
               cell.configureCell(imageString: image, productTitle: name)

           
            return cell
        default:
            return UICollectionViewCell()
        }
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionFooter:
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "FooterSupplementaryView", for: indexPath) as! FooterSupplementaryView
            self.viewModel.pageIndicator.sink { page in
                footer.configureCurrentPage(currentPage: page)
            }.store(in: &canceballe)
            footer.configurePageCount(pageCount: localData[0].count)
            return footer
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderSupplementaryView", for: indexPath) as! HeaderSupplementaryView
            if indexPath.section == 0 {
                header.setupTitle(title: "Suggections")
            }
            if indexPath.section == 1 {
                header.setupTitle(title: "Find in categories")
            }
            
            
            return header
        default:
            return UICollectionReusableView()
        }
        
        
    }
   
}

// MARK: - ConfigureUI
private extension mainCategoryView {

    func configureUI() {
       addSubview(customBar)
        customBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(customBar.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalTo(self).offset(0)
        }

        activityIndicator.snp.makeConstraints {
            $0.centerX.equalTo(self).offset(0)
            $0.centerY.equalTo(self).offset(0)
        }
    }
}
