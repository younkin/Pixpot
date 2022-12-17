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
        let vc = moduleFactory.makeMainModule()
//        vc.modalPresentationStyle = .overFullScreen
        self.router.push(vc, animated: true)
        
        
        vc.showFilter = { [weak self] showFilter in
            
            if showFilter {
//                self.router.push(FilterView, animated: true)
            }
            
        }
        
    }
}
