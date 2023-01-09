//
//  BusketCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit

final class BusketCoordinator: BaseCoordinator {
    
    // MARK: - Properies
    private let moduleFactory: ModuleFactoryProtocol
    private let router: Router

    // MARK: - Init
    init(router: Router, moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
        self.router = router
    }

    // MARK: - Navigation functions
    override func start() {
        showBusketScreen()
    }

    // MARK: - 
    private func showBusketScreen() {
        let basketVC = moduleFactory.makeBusketModule()
        basketVC.basketViewModel.onMainScreen = { [weak self] in
            basketVC.tabBarController?.selectedIndex = 0
            basketVC.tabBarController?.tabBar.isHidden = false 
        }
    
        basketVC.basketViewModel.onProductScreen = { [weak self] in
            self?.makeProductScreen()
        }
        router.push(basketVC)
        
    }
    
    private func makeProductScreen() {
        let productVC = self.moduleFactory.makeProductModule()
        productVC.productViewModel.isFinish = { [weak self] in
            self?.router.pop(animated: true)
        }
        self.router.push(productVC)
    }
    
}
