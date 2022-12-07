//
//  AppCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

final class AppCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router

    // MARK: - Initialisers

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    // MARK: - Public Methods

    override func start() {
        runTabBar()
    }

    // MARK: - Private Methods

    private func runTabBar() {
        let tabBarCoordinator = coordinatorFactory.makeTabBarCoordinator(with: router)
        retain(tabBarCoordinator)
        tabBarCoordinator.start()
    }
}
