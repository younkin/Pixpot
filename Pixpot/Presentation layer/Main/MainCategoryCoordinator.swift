//
//  MainViewCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit

protocol MainCategoryCoordinatorOutput {
    var onSelectItem: ((ListItem) -> Void)? {get set}
}

final class MainCategoryCoordinator: BaseCoordinator, MainCategoryCoordinatorOutput {

    var onSelectItem: ((ListItem) -> Void)?
    
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
        let mainPage = moduleFactory.makeCatalogFoodModule()
        
        self.router.push(mainPage, animated: true)
        
        
        mainPage.tapIndex = { [weak self] item in
            self?.onSelectItem?(item)
//            print(indexPath)
//            mainPage.tabBarController?.selectedIndex = 1
           
        }
//        mainPage.showDitailProduct = {[weak self] IndexPath in
//            let product = self?.moduleFactory.makeProductModule()
            
//            product?.productViewModel.isFinish = { [weak self] in
//                self?.router.pop(animated: true)
//            }
//
//            self?.router.push(product!, animated: true)

         }
    
    
}
