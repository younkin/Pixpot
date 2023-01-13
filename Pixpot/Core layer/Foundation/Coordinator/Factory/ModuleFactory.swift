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
    
    func makeFavoriteModule() -> FavoriteViewController
  
    func makeProfileModule() -> ProfileViewController
    func makeProductModule() -> ProductViewController
    func makeCalendarModule() -> CalendarViewController
    func makeWebViewModule(site: String,title: String) -> WebViewController
    func makeLoadingModule() -> LoadingScreenViewController
}

final class ModuleFactory: ModuleFactoryProtocol {
    
    private lazy var container = DIContainer()
    
    func makeCatalogFoodModule() -> CatalogFoodController {
        let viewModel = CatalogFoodViewModel(productService: container.productService
        )
  
        let controller = CatalogFoodController(viewModel: viewModel)
        return controller
    }
    
    func makeTabBarModule() -> TabBarController {
        return TabBarController()
    }
    func makeWebViewModule(site: String,title: String) -> WebViewController {
        return WebViewController(site: site, title: title, withExitButton: false, withBackButton: false)
    }

    func makeFavoriteModule() -> FavoriteViewController {
        return FavoriteViewController()
    }
    
    func makeProfileModule() -> ProfileViewController {
        return ProfileViewController()
    }
    func makeCalendarModule() -> CalendarViewController {
        return CalendarViewController()
    }
    
    func makeLoadingModule() -> LoadingScreenViewController{
        let viewmodel = LoadingScreenViewModel(service: container.countryService)
        return LoadingScreenViewController(viewModel: viewmodel)
    }
    func makeProductModule() -> ProductViewController {
        let viewModel = ProductViewModel(service: container.productService)
        return ProductViewController(viewModel: viewModel)
    }
    
}

