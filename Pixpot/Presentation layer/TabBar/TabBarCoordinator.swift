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

    private let coordinatorFactory: CoordinatorFactory
    private let router: Router
    private var tabBarController = TabBarController()

    // MARK: - Initialisers

    init(router: Router, coordinatorFactory: CoordinatorFactory) {
        self.coordinatorFactory = coordinatorFactory
        self.router = router
    }

    // MARK: - Public Methods

    override func start() {
        initializeTabBar()
    }

    // MARK: - Private Methods

    private func initializeTabBar() {
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
