//
//  LoadingScreenCoordinator.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 13.01.23.
//




import UIKit

final class LoadingScreenCoordinator: BaseCoordinator {

    // MARK: - Properies
    private let moduleFactory: ModuleFactoryProtocol
    private let router: Router
    var appWay: ((LaunchInstructor) -> Void)?

    // MARK: - Init
    init(router: Router, moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
        self.router = router
    }

    // MARK: - Navigation functions
    override func start() {
        showLoadingScreen()
    }

    // MARK: -
    private func showLoadingScreen() {
        
        let loadingPage = moduleFactory.makeLoadingModule()
        self.router.present(loadingPage, animated: true)

        
        loadingPage.appWay = { [weak self] appWay in
            guard let self = self else {return}
            self.appWay?(appWay)
            
        }
         }
}

