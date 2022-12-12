//
//  TabBarCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

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
        mainNavigationController.tabBarItem = UITabBarItem(title: "Explorer", image: UIImage(named: "dot"), tag: 0)
        let mainCoordinator = coordinatorFactory.makeMainCoordinator(with: Router(rootController: mainNavigationController))
        
        let basketNavigationController = MainNavigationController()
        basketNavigationController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "busket"), tag: 1)
        let basketCoordinator = coordinatorFactory.makeBusketCoordinator(with: Router(rootController: basketNavigationController))
        let FavoriteViewController = FavoriteViewController()
        FavoriteViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "heart"), tag: 2)
        
        let ProfileViewController = ProfileViewController()
        ProfileViewController.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "profile"), tag: 3)
    
       
    
        
        tabBarController.viewControllers = [mainNavigationController,basketNavigationController,FavoriteViewController,ProfileViewController]
        
        
        router.setRoot(tabBarController, animated: false, hideBar: true)

        retain(mainCoordinator)
        retain(basketCoordinator)

        mainCoordinator.start()
        basketCoordinator.start()


    
        
        
      
    }



    


}
