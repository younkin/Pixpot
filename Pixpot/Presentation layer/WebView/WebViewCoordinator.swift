//
//  WebViewCoordinator.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 12.01.23.
//


import UIKit

final class WebViewCoordinator: BaseCoordinator {

    // MARK: - Properies
    private let moduleFactory: ModuleFactoryProtocol
    private let router: Router

    // MARK: - Init
    init(router: Router, moduleFactory: ModuleFactoryProtocol) {
        self.moduleFactory = moduleFactory
        self.router = router
    }

    // MARK: - Navigation functions
    override func start() {
//        showWebScreen()
    }

    // MARK: -
//    private func showWebScreen() {
//
//        let webView = WebViewController(site: "https://www.google.com/", title: "some title", withExitButton: false, withBackButton: false)
//        webView.modalPresentationStyle = .fullScreen
//        self.router.setRoot(webView, animated: false)
////        self.router.present(webView, animated: false)
//         }
}

