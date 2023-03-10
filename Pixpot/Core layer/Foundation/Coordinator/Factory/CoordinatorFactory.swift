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

    func makeMainCoordinator(with router: Router) -> MainCategoryCoordinator & MainCategoryCoordinatorOutput
    func makeProfileCoordinator(with router: Router) -> ProfileCoordinator
    func makeCalendarCoordinator(with router: Router) -> CalendarCoordinator & PushRoutable

}

enum Deeplink {
    case item(ListItem)
}

protocol PushRoutable {
    func consume(_ deeplink: Deeplink)
}

final class CoordinatorFactory: CoordinatorFactoryProtocol {

    private let moduleFactory: ModuleFactoryProtocol

    init(moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
    }

    func makeMainCoordinator(with router: Router) -> MainCategoryCoordinator  & MainCategoryCoordinatorOutput {
        return MainCategoryCoordinator(router: router, moduleFactory: moduleFactory)
    }

    
    func makeProfileCoordinator(with router: Router) -> ProfileCoordinator {
        return ProfileCoordinator(router: router, moduleFactory: moduleFactory)
    }
    func makeCalendarCoordinator(with router: Router) -> CalendarCoordinator & PushRoutable{
        return CalendarCoordinator(router: router, moduleFactory: moduleFactory)
    }
   
    
    
    func makeApplicationCoordinator(with router: Router) -> AppCoordinator {
        return AppCoordinator(router: router, coordinatorFactory: self, modulesFactory: moduleFactory)
    }

    func makeTabBarCoordinator(with router: Router) -> TabBarCoordinator {
        return TabBarCoordinator(router: router, coordinatorFactory: self, moduleFactory: moduleFactory)
    }
  
  
    

}
