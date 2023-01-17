//
//  TabBarCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit
import SnapKit

final class TabBarCoordinator: BaseCoordinator {

    // MARK: - Private Properties

    private let coordinatorFactory: CoordinatorFactoryProtocol
    private let router: Router
    private var tabBarController = TabBarController()
    private let moduleFactory: ModuleFactoryProtocol
    
    private lazy var container = DIContainer()

    // MARK: - Initialisers

    init(router: Router, coordinatorFactory: CoordinatorFactoryProtocol, moduleFactory: ModuleFactoryProtocol ) {
        self.moduleFactory = moduleFactory
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }

    // MARK: - Public Methods

    override func start() {
        performAppFlow()
    }

    // MARK: - Private Methods

    private func performAppFlow() {
        // стандартная реализация таба

        let mainNavigationController = MainNavigationController()
        mainNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"HomeOn"), tag: 0)
        
        let mainCoordinator = coordinatorFactory.makeMainCoordinator(with: Router(rootController: mainNavigationController))
        
        let calendarController = MainNavigationController()
        calendarController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"CalendarOff"), tag: 1)
        let calendarCoordinator = coordinatorFactory.makeCalendarCoordinator(with: Router(rootController: calendarController))
        
        let profileViewController = MainNavigationController()
        profileViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named:"UserOff"), tag: 2)
        let profileCoordinator = coordinatorFactory.makeProfileCoordinator(with: Router(rootController: profileViewController))
    
        tabBarController.viewControllers = [mainNavigationController,calendarController,profileViewController]
        
        
        
        router.setRoot(tabBarController, animated: false, hideBar: true)

        retain(mainCoordinator)
        retain(calendarCoordinator)
        retain(profileCoordinator)
        
        mainCoordinator.start()
        calendarCoordinator.start()
        profileCoordinator.start()
        
        mainCoordinator.onSelectItem = { [weak self, weak calendarCoordinator] item in
            self?.tabBarController.selectedIndex = 1
            calendarCoordinator?.consume(.item(item))
        }
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
