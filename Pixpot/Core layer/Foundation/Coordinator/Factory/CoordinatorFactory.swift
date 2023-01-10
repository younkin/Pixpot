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
    
    func makeFavoriteCoordinator(with router: Router) -> FavoriteCoordinator
    func makeBusketCoordinator(with router: Router) -> BusketCoordinator
    func makeProfileCoordinator(with router: Router) -> ProfileCoordinator
    func makeCalendarCoordinator(with router: Router) -> CalendarCoordinator

    
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {

    private let moduleFactory: ModuleFactoryProtocol

    init(moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
    }

    func makeMainCoordinator(with router: Router) -> CatalogFoodCoordinator {
        return CatalogFoodCoordinator(router: router, moduleFactory: moduleFactory)
    }
    func makeFavoriteCoordinator(with router: Router) -> FavoriteCoordinator {
        return FavoriteCoordinator(router: router, moduleFactory: moduleFactory)
    }
    
    func makeBusketCoordinator(with router: Router) -> BusketCoordinator {
        return BusketCoordinator(router: router, moduleFactory: moduleFactory)
    }
    
    func makeProfileCoordinator(with router: Router) -> ProfileCoordinator {
        return ProfileCoordinator(router: router, moduleFactory: moduleFactory)
    }
    func makeCalendarCoordinator(with router: Router) -> CalendarCoordinator {
        return CalendarCoordinator(router: router, moduleFactory: moduleFactory)
    }
    
    
    func makeApplicationCoordinator(with router: Router) -> AppCoordinator {
        return AppCoordinator(router: router, coordinatorFactory: self)
    }

    func makeTabBarCoordinator(with router: Router) -> TabBarCoordinator {
        return TabBarCoordinator(router: router, coordinatorFactory: self)
    }

}
