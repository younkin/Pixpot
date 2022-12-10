//
//  MainNavigationController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit

final class MainNavigationController: UINavigationController {

    init() {
        super.init(nibName: nil, bundle: nil)
        self.setStatusBar()
        setConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Public API
extension MainNavigationController {

}

// MARK: - Private API
private extension MainNavigationController {
    
    
    func setConstraints() {
        
    }

    func setStatusBar() {
        let arrowImage = UIImage(systemName: "arrow.left")
        let transImage = UIImage(systemName: "arrow.left")
        let navBarAppearance = UINavigationBarAppearance()
        
        
        
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: AppColors.orange]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: AppColors.darkBlue]
        navBarAppearance.backgroundColor = AppColors.darkBlue
        navBarAppearance.setBackIndicatorImage(arrowImage, transitionMaskImage: transImage)
        navBarAppearance.shadowColor = AppColors.black

        navigationBar.tintColor = UIColor.black
        navigationBar.standardAppearance = navBarAppearance
        navigationBar.scrollEdgeAppearance = navBarAppearance
        navigationBar.isTranslucent = true
    }
}
