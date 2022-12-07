//
//  ViewController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//



import UIKit

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarColors()
//        setupTabBarBlur()
        setupTabBarBorder()
    }
    
    private func setupTabBarColors() {
        UITabBar.appearance().unselectedItemTintColor = .black
        UITabBar.appearance().tintColor = AppColors.darkBlue
        UITabBar.appearance().backgroundImage = UIImage(named: "Rectangle")
        
    }

    private func setupTabBarBlur() {
        let image = UIImage(named: "Rectangle")
//        let image = UIImage().withTintColor(AppColors.darkBlue)
        let bluredImageView = UIImageView(frame: tabBar.bounds)
        bluredImageView.image = image
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .systemThinMaterialLight))
        blurEffectView.frame = bluredImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tabBar.addSubview(blurEffectView)
        tabBar.backgroundImage = bluredImageView.image
    }

    private func setupTabBarBorder() {
        let borderLine = UIView(frame: CGRect(x: 0, y: 0, width: tabBar.frame.width, height: 0.5))
        borderLine.backgroundColor = AppColors.orange
        tabBar.addSubview(borderLine)
        tabBar.shadowImage = UIImage()
    }
}


