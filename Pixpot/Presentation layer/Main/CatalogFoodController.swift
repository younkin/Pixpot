//
//  CategoryFoodController.swift
//  Sarawan
//
//  Created by MAC on 04.11.2021.
//

import UIKit
import Combine

final class CatalogFoodController: UIViewController {

    
    // MARK: - Outlets
    lazy var catalogFoodView = self.view as? CatalogFoodView

    // MARK: - Properties
    let viewModel: CatalogFoodViewModel
    var canceballe = Set<AnyCancellable>()

    // MARK: - Init
    init(viewModel: CatalogFoodViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        let view = CatalogFoodView(viewModel: viewModel)
       
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.darkBlue
//        viewModel.getAllFoodMainCatalogs()
//
       
        refreshingData()
//        setupBindings()
        

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
 
//        catalogFoodView?.removeTextTextField()
    }




    private func refreshingData() {
//        catalogFoodView?.startingActivityIndicator()
//        catalogFoodView?.isHiddenCollectionView(isLoadingIndicator: true)

     
        viewModel.isLoadingIndicator.sink(receiveValue: { isLoadingIndicator in
            UIView.animate(withDuration: 0.2) {
                self.catalogFoodView?.stopActivityIndicator()
                self.catalogFoodView?.isHiddenCollectionView(isLoadingIndicator: isLoadingIndicator)
            }
        }).store(in: &canceballe)
    }
}

//// MARK: - Public API
//extension CatalogFoodController {
//    func setupBindings() {
//        catalogFoodView?.searchView.textField
//            .textPublisher
//            .receive(on: DispatchQueue.main)
//            .assign(to: \.nameFood, on: viewModel)
//            .store(in: &canceballe)
//    }
//}
//

// MARK: - Public API


//// MARK: - CatalogFoodViewProtocol
//extension CatalogFoodController: CatalogFoodViewProtocol {
//    func didTapSearchButtonView() {
//        if !viewModel.nameFood.isEmpty {
//            viewModel.onCategoryScreen?(.productsBySearchName(foodName: viewModel.nameFood))
//        }
//    }
//
//    func collectionView(didSelect typeFoodQuery: TypeFoodQuery) {
//        viewModel.onCategoryScreen?(typeFoodQuery)
//    }
//}
