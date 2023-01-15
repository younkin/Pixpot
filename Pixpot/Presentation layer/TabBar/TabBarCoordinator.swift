//
//  TabBarCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit
import SnapKit

enum LaunchInstructor {
    case countryVerify
    case webView
    case app
}

final class TabBarCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    private var tabBarController = TabBarController()
    private let moduleFactory: ModuleFactoryProtocol
    private var launch: LaunchInstructor = .countryVerify
    private lazy var container = DIContainer()

    // MARK: - Initialisers

    init(router: Router, coordinatorFactory: CoordinatorFactory, moduleFactory: ModuleFactoryProtocol ) {
        self.moduleFactory = moduleFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }

    // MARK: - Public Methods

    override func start() {
        switch launch {
        case .countryVerify:
            break
//            performCountryFlow()
        case .webView:
            break
//            performWebViewFlow()
        case .app:
            break
//            performAppFlow()
        }
//        initializeTabBar()
        showLoadingScreen()
//        askPermisions()
    }

    // MARK: - Private Methods
    private func askPermisions() {
        var type: PermissionsType
        type = .location
    
        let vc = AskPermisionsVS(permissionsType: type)
        self.router.setRoot(vc, animated: false)
        
        vc.skipped = {
            self.startApp()
        }
    }

    lazy var viewmodel = CountrySelector(service: container.countryService, helperService: container.helperService)
    
    private func showLoadingScreen() {
        
//        let loadingPage = moduleFactory.makeLoadingModule()
//        self.router.present(loadingPage, animated: true)
        
        viewmodel.appWay = { [weak self] appWay , link in
            guard let self = self else {return}
            switch appWay {
            case.webView:
                DispatchQueue.main.async {
                    self.showWebScreen(link: link)
                }
            case.app:
                DispatchQueue.main.async {
                    self.startApp()
                }
            default:
                break
            }
            
        }
    }
    
    
    private func showWebScreen(link: String) {

        let webView = WebViewController(site: link, title: "some title", withExitButton: false, withBackButton: false)
        webView.modalPresentationStyle = .fullScreen
        self.router.setRoot(webView, animated: false)
//        self.router.present(webView, animated: false)
    }
    

    private func startApp() {
        // стандартная реализация таба

        let mainNavigationController = MainNavigationController()
        mainNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"homeOn"), tag: 0)
        
        let mainCoordinator = coordinatorFactory.makeMainCoordinator(with: Router(rootController: mainNavigationController))
        
        let calendarController = MainNavigationController()
        calendarController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"calendarOff"), tag: 1)
        let calendarCoordinator = coordinatorFactory.makeCalendarCoordinator(with: Router(rootController: calendarController))
        
//        let basketNavigationController = MainNavigationController()
//        basketNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"calendarOff"), tag: 1)
//        let basketCoordinator = coordinatorFactory.makeBusketCoordinator(with: Router(rootController: basketNavigationController))
//
        
        
        let profileViewController = MainNavigationController()
        profileViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"userOff"), tag: 2)
        let profileCoordinator = coordinatorFactory.makeProfileCoordinator(with: Router(rootController: profileViewController))
    
        tabBarController.viewControllers = [mainNavigationController,calendarController,profileViewController]
        
        router.setRoot(tabBarController, animated: false, hideBar: true)

        retain(mainCoordinator)
        retain(calendarCoordinator)
        retain(profileCoordinator)
        
        mainCoordinator.start()
        calendarCoordinator.start()
        profileCoordinator.start()
    }



    


}

/*
 geoService.getSportStadiums(
     place: .stadium,
     filter: .circle(lat: 37.785834, long: -122.406417, radius: 5000)
 ) { [weak self] result in
     switch result {
     case .success(let stadiums):
         debugPrint(stadiums)
     case .failure(let error):
         print(error.localizedDescription)
     }
 }
 */
