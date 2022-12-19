//
//  MainViewCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit

final class MainViewCoordinator: BaseCoordinator {

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
        showMainScreen()
    }

    // MARK: -
    private func showMainScreen() {
        let mainPage = moduleFactory.makeMainModule()
        
        self.router.push(mainPage, animated: true)
        
        mainPage.showDitailProduct = {[weak self] IndexPath in
            let product = self?.moduleFactory.makeProductModule()
            
            product?.productViewModel.isFinish = { [weak self] in
                self?.router.pop(animated: true)
            }
            
            self?.router.push(product!, animated: true)
            
        }
        
    }
}
