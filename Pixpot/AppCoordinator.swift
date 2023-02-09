//
//  AppCoordinator.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit
import Combine
import UserNotifications

enum LaunchInstructor {
    case wayVerify
    case webView(String)
    case locationVerify
    case app
}

final class AppCoordinator: BaseCoordinator {

    // MARK: - Private Properties
   
    private let coordinatorFactory: CoordinatorFactory
    private let modulesFactory: ModuleFactoryProtocol
    private let router: Router
    
    private var launch: LaunchInstructor = .wayVerify
    private var permisionType: PermissionsType = .push
    private let locationService: IDeviceLocationService & DeviceLocationServiceOutput = DeviceLocationService.shared
    private var bag = Set<AnyCancellable>()
    
    // MARK: - Initialisers

    init(
        router: Router,
        coordinatorFactory: CoordinatorFactory,
        modulesFactory: ModuleFactoryProtocol
    ) {
        self.router = router
        self.modulesFactory = modulesFactory
        self.coordinatorFactory = coordinatorFactory
    }

    // MARK: - Public Methods

    override func start() {
        performFlow()
    }

    // MARK: - Private Methods
    private func performFlow() {
        switch launch {
        case .wayVerify:
            performAppWayFlow()
        case .locationVerify:
            
            switch permisionType {
            case .push:
                checkPushPermission { status in
                    switch status {
                    case .notDetermined:
                        DispatchQueue.main.async {
                            self.performAskPush()
                        }
                    default:
                        self.permisionType = .location
                        self.performFlow()
                    }
                }
                
            case .location:
                if locationService.authStatus == .notDetermined {
                    DispatchQueue.main.async {
                        self.performLocationVerify()
                    }
                } else {
//                    permisionType = .push
//                    performFlow
                    performAppFlow()
                }
                
            }
           
        case .webView(let link):
            performWebViewFlow(link: link)
        case .app:
            performAppFlow()
       
        }
    }
    
    private func performAppWayFlow() {
        let (vc, output) = modulesFactory.makeAppWayLaunch()
        output.appWay = { [weak self] appway in
            self?.launch = appway
            DispatchQueue.main.async {
                self?.performFlow()
            }
        }
        router.setRoot(vc, animated: false)
    }
    
    
    private func performAppFlow() {
        let tabBarCoordinator = coordinatorFactory.makeTabBarCoordinator(with: router)
        retain(tabBarCoordinator)
        tabBarCoordinator.start()
    }
    
    private func performWebViewFlow(link: String) {
        let webView = WebViewController(site: link, title: "some title", withExitButton: false, withBackButton: false)
        webView.modalPresentationStyle = .fullScreen
        router.setRoot(webView, animated: false)
    }
    
    private func performLocationVerify() {
        locationService.authStatusPublisher
            .sink { [weak self] status in
                switch status {
                case .notDetermined:
                    self?.performAskLocation()
                case .none:
                    break
                case .denied, .authorizedAlways, .restricted, .authorizedWhenInUse:
                    self?.launch = .app
                    self?.permisionType = .location
                    self?.performFlow()
                case .some(_):
                    break
                }
            }
            .store(in: &bag)
    }
    
 
    
    private func performAskLocation() {
        
        let vc = AskPermisionsVS(permissionsType: self.permisionType)
        self.router.setRoot(vc, animated: false)

        vc.skipped = { [weak self] in
            self?.launch = .app
            self?.performFlow()
        }
    }
    
    
    private func performAskPush() {
        
        let vc = AskPermisionsVS(permissionsType: self.permisionType)
        self.router.setRoot(vc, animated: false)

        vc.skipped = { [weak self] in
            self?.launch = .locationVerify
            self?.permisionType = .location
            self?.performFlow()
        }
    }
    
    
    
    func checkPushPermission(completionHandler: @escaping (PushPermision) -> Void) {
        let current = UNUserNotificationCenter.current()
        current.getNotificationSettings(completionHandler: { permission in
            switch permission.authorizationStatus  {
            case .authorized:
                completionHandler(.granted)
                print("User granted permission for notification")
            case .denied:
                completionHandler(.denied)
                print("User denied notification permission")
            case .notDetermined:
                completionHandler(.notDetermined)
                print("Notification permission haven't been asked yet")
            case .provisional:
                completionHandler(.denied)
                // @available(iOS 12.0, *)
                print("The application is authorized to post non-interruptive user notifications.")
            case .ephemeral:
                completionHandler(.denied)
                // @available(iOS 14.0, *)
                print("The application is temporarily authorized to post notifications. Only available to app clips.")
            @unknown default:
                completionHandler(.denied)
                print("Unknow Status")
            }
        })
    }
}


//
//private func performPushVerify() {
//        center.getNotificationSettings(completionHandler: { settings in
//            DispatchQueue.main.async {
//                switch settings.authorizationStatus {
//                case .authorized, .denied, .provisional, .ephemeral:
//                    print(".authorized, .denied, .provisional, .ephemeral")
//                    self.launch = .app
//                    self.performFlow()
//                case .notDetermined:
//                    print("not determined, ask user for permission now")
//                    self.performAsk(type: .push)
//                @unknown default:
//                    self.launch = .app
//                    self.performFlow()
//                }
//            }
//        })
//    }
