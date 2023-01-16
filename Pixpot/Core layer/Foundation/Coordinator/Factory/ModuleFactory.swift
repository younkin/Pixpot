//
//  ModuleFactory.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import Foundation

protocol ModuleFactoryProtocol {
    func makeAppWayLaunch() -> (vc: AppLaunchWayViewController, output: AppLaunchOutput)
    func makeTabBarModule() -> TabBarController
    func makeCatalogFoodModule() -> mainCategoryController
    
  
    func makeProfileModule() -> ProfileViewController
    func makeCalendarModule() -> CalendarViewController
    func makeWebViewModule(site: String,title: String) -> WebViewController

}

final class ModuleFactory: ModuleFactoryProtocol {
    
    private lazy var container = DIContainer()
    
    func makeAppWayLaunch() -> (vc: AppLaunchWayViewController, output: AppLaunchOutput) {
        let vm = AppLaunchWayViewModel(
            countryService: container.countryService,
            helperService: container.helperService
        )
        let vc = AppLaunchWayViewController(viewModel: vm)
        return (vc, vm)
    }
    
    func makeCatalogFoodModule() -> mainCategoryController {
        let viewModel = mainCategoryViewModel()
  
        let controller = mainCategoryController(viewModel: viewModel)
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

