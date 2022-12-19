//
//  MainView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    var mainViewModel: MainViewModel
    var subscriptions = Set<AnyCancellable>()
    var showFilter: ((Bool) -> Void)?
    var showDitailProduct: ((Int) -> Void)?
    private let sections = MockData.shared.pageData
    lazy var mainView = self.view as? MainView

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        
        setupBindings()
    }
    
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        let view = MainView()
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupBindings() {
        getData()
        
        mainView?.filterButton.tapPublisher.sink(receiveValue: { [weak self] in
            self?.mainView?.filterView.isHidden = false
        }).store(in: &subscriptions)
        
        mainView?.bestSellTapped = {[weak self] IndexPath in
            self?.showDitailProduct!(IndexPath)
        }
        
        mainView?.filterView.backButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                self?.mainView?.filterView.isHidden = true
            }).store(in: &subscriptions)
        
        
        mainViewModel.basketService.basketSubject.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error with \(error)")
            case .finished:
                print("Success!")
            }
        }, receiveValue: { [weak self] basket in
            DispatchQueue.main.async {
                guard let item = self?.navigationController?.tabBarController?.tabBar.items?[1] else { return }
                if basket.basket.count <= 0 {
                    item.badgeValue = nil
                    item.badgeColor = nil
                } else {
                    item.badgeValue = String(basket.basket.count)
                    item.badgeColor = AppColors.orange
                }
            }
        }).store(in: &subscriptions)
        
        mainViewModel.getBasket()
    }
    
    func getData() {
        mainViewModel.getMain()
        
        mainViewModel.mainData.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error with \(error)")
            case .finished:
                print("Success!")
            }
        }, receiveValue: { [weak self] mainData in
            DispatchQueue.main.async {
                self?.mainView?.mainData = mainData
                self?.mainView?.filterView.brandBtn.dropView.dropDownOptions = mainData.bestSeller.map { $0.title}
                self?.mainView?.filterView.brandBtn.dropView.tableView.reloadData()
                self?.mainView?.collectionView.reloadData()
                
            }
        }).store(in: &subscriptions)
    }
    
}









