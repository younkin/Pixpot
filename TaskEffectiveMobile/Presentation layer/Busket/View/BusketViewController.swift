//
//  BusketViewController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit
import Foundation
import Combine

final class BusketViewController: UIViewController {
    
    let basketViewModel: BasketViewModel
    private lazy var basketView = self.view as? BasketView
    var subscriptions = Set<AnyCancellable>()
    
    init(basketViewModel: BasketViewModel) {
        self.basketViewModel = basketViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        let basketView = BasketView()
        self.view = basketView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        refreshData()
        setupBindings()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    private func refreshData() {
        basketView?.startingActivityIndicator()
        basketView?.isHiddenCollectionView(isLoadingIndicator: true)
        
        basketViewModel.getBasket()
        basketViewModel.isLoadingIndicator.sink(receiveValue: { isLoadingIndicator in
            UIView.animate(withDuration: 0.2) {
                self.basketView?.stopActivityIndicator()
                self.basketView?.isHiddenCollectionView(isLoadingIndicator: isLoadingIndicator)
            }
        }).store(in: &subscriptions)
    }
    
    private func setupBindings() {
        basketView?.backButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                self?.basketViewModel.onMainScreen?()
        })
        .store(in: &subscriptions)
        
        basketViewModel.basketService.basketSubject.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error with \(error)")
            case .finished:
                print("Success!")
            }
        }, receiveValue: { [weak self] basket in
            DispatchQueue.main.async {
                self?.basketView?.customTable.totalCostLbl.text = String(basket.total)
                self?.basketView?.customTable.delivaryCostLbl.text = basket.delivery
                self?.basketView?.customTable.basket = basket.basket
                self?.basketView?.customTable.basketTableView.reloadData()
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
        
        basketView?.customTable.deleteProduct = { [weak self] index in
            self?.basketViewModel.removeProduct(at: index.row)
            self?.basketView?.customTable.basket.remove(at: index.row)
            self?.basketView?.customTable.basketTableView.deleteRows(at: [index], with: .automatic)
            DispatchQueue.main.async {
                self?.basketView?.customTable.basketTableView.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
