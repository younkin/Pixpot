//
//  ProfileCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit

final class ProfileCoordinator: BaseCoordinator {

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
        showProfileScreen()
    }

    // MARK: -
    private func showProfileScreen() {

        let profilePage = moduleFactory.makeProfileModule()
        
        self.router.push(profilePage, animated: true)
    }
}
