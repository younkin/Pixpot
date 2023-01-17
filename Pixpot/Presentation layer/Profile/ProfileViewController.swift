//
//  ProfileViewController.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 08.12.22.
//

import UIKit
import SnapKit
import WebKit

class ProfileViewController: UIViewController, UIWebViewDelegate {
    
    let webView = WKWebView()
    let location = DeviceLocationService.shared

    
    
    
    
    
    private let customBar: UICustomBar = {
        let bar = UICustomBar()
        bar.configure(title: "Find all sports \n near you", imageName: "PixtopLogo")
        return bar
    }()
    
    private lazy var button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("MY TRAINS", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .heavy)
        button.tintColor = AppColors.white
        button.backgroundColor = AppColors.blue
        button.tag = 1
        button.addTarget(self, action: #selector(buttonTap), for:.touchUpInside)
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RATE US", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .heavy)
        button.tintColor = AppColors.white
        button.backgroundColor = AppColors.blue
        button.tag = 2
        button.addTarget(self, action: #selector(buttonTap), for:.touchUpInside)
        return button
    }()
    
    private lazy var button3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SEND FEEDBACK", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .heavy)
        button.tintColor = AppColors.white
        button.backgroundColor = AppColors.blue
        button.tag = 3
        button.addTarget(self, action: #selector(buttonTap), for:.touchUpInside)
        return button
    }()
    
    private lazy var button4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("PRIVACY POLICY", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .heavy)
        button.tintColor = AppColors.white
        button.backgroundColor = AppColors.blue
        button.tag = 4
        button.addTarget(self, action: #selector(buttonTap), for:.touchUpInside)
        return button
    }()
    
    private lazy var button5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("TERMS OF USE", for: .normal)
        button.titleLabel?.textAlignment = .left
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .heavy)
        button.tintColor = AppColors.white
        button.backgroundColor = AppColors.blue
        button.tag = 5
        button.addTarget(self, action: #selector(buttonTap), for:.touchUpInside)
        return button
    }()
    

override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(webView)
   
    setupViews()
    view.backgroundColor = AppColors.darkBlue
    
    navigationController?.isNavigationBarHidden = true
    
//    let bar = UINavigationController() as? MainNavigationController
    

//    navigationItem.titleView = customTitleView
//
//    title = "123123123"
//    self.navigationController?.isNavigationBarHidden = false
   
   
//
//    let customTitleView = createCustomTitleView(barTitle: "App", contactDiscription: "Apptext", barImage: "barImage")
    
}
    
       


    @objc func buttonTap(sender: UIButton) {
        switch sender.tag {
        case 1:
            print(sender.tag)
        case 2:
            print(sender.tag)
            
        case 3:
            print(sender.tag)
            self.showWebView(url: "https://pixpot.host/#support", title: "support")
        case 4:
            print(sender.tag)
            self.showWebView(url: "https://pixpot.host/privacy.html", title: "support")
        case 5:
            print(sender.tag)
            self.showWebView(url: "https://pixpot.host/terms.html", title: "support")
        default:
            print(sender.tag)
        }
    }
    
    
    func showWebView(url: String, title: String) {
        let web = WebViewController(site: url, title: title, withExitButton: true, withBackButton: false)
         self.present(web, animated: true)
    }



    

    override func viewDidLayoutSubviews() {
//        webView.frame = view.bounds
        
        let size = min(button1.layer.frame.width , button1.layer.frame.height)
        button1.layer.cornerRadius = size / 10
        button2.layer.cornerRadius = size / 10
        button3.layer.cornerRadius = size / 10
        button4.layer.cornerRadius = size / 10
        button5.layer.cornerRadius = size / 10
    }

    
    private func setupViews() {
        // Add the buttons to the view
        view.addSubview(customBar)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
 
        customBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        // Use SnapKit to layout the buttons
        button1.snp.makeConstraints {
            $0.top.equalTo(customBar.snp.bottom).offset(50)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        button2.snp.makeConstraints {
            $0.top.equalTo(button1.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        button3.snp.makeConstraints {
            $0.top.equalTo(button2.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        button4.snp.makeConstraints {
            $0.top.equalTo(button3.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        button5.snp.makeConstraints {
            $0.top.equalTo(button4.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        
    }
}
