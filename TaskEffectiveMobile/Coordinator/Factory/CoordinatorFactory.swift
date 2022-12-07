//
//  CoordinatorFactory.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//


import Foundation

protocol CoordinatorFactoryProtocol {

    func makeApplicationCoordinator(with router: Router) -> AppCoordinator
    func makeTabBarCoordinator(with router: Router) -> TabBarCoordinator

    
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {

    private let moduleFactory: ModuleFactoryProtocol

    init(moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
    }

    func makeMain(with router: Router) -> MainViewCoordinator {
        return MainViewCoordinator(router: router, moduleFactory: moduleFactory)
    }
    func makeApplicationCoordinator(with router: Router) -> AppCoordinator {
        return AppCoordinator(router: router, coordinatorFactory: self)
    }

    func makeTabBarCoordinator(with router: Router) -> TabBarCoordinator {
        return TabBarCoordinator(router: router, coordinatorFactory: self)
    }

    
}
