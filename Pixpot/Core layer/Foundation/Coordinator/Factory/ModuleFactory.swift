//
//  ModuleFactory.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import Foundation

protocol ModuleFactoryProtocol {
    func makeTabBarModule() -> TabBarController
    func makeCatalogFoodModule() -> CatalogFoodController
    
  
    func makeProfileModule() -> ProfileViewController
    func makeCalendarModule() -> CalendarViewController
    func makeWebViewModule(site: String,title: String) -> WebViewController

}

final class ModuleFactory: ModuleFactoryProtocol {
    
    private lazy var container = DIContainer()
    
    func makeCatalogFoodModule() -> CatalogFoodController {
        let viewModel = CatalogFoodViewModel()
  
        let controller = CatalogFoodController(viewModel: viewModel)
        return controller
    }
    
    func makeTabBarModule() -> TabBarController {
        return TabBarController()
    }
    func makeWebViewModule(site: String,title: String) -> WebViewController {
        return WebViewController(site: site, title: title, withExitButton: false, withBackButton: false)
    }
    
    func makeProfileModule() -> ProfileViewController {
        return ProfileViewController()
    }
    func makeCalendarModule() -> CalendarViewController {
        return CalendarViewController()
    }
    
}

