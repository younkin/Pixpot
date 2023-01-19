//
//  AskPermisionsVC.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 14.01.23.
//

import Foundation
import UIKit
import SnapKit
import CoreLocation


enum PermissionsType {
    case push
    case location
    
    var title: String {
        switch self {
        case .push:
            return "Please, allow us to send you push-notifications for reminders."
        case .location:
            return "Please, allow us to track your location to find the most relevant sports facilities. "
        }
    }
}


class AskPermisionsVS: UIViewController{
    
    
    let permissionsType: PermissionsType
  
    var locationService = DeviceLocationService.shared
    
    var skipped: (() -> Void)?
    
    private lazy var topLabel: UILabel = {
         let label = UILabel()
        label.text = "We are almost ready!"
        label.backgroundColor = AppColors.green
        label.textColor = AppColors.black
        label.textAlignment = .center
        label.contentMode = .center
         return label
     }()
    
    
    private lazy var permisionText: UILabel = {
         let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.textColor = AppColors.white
        label.numberOfLines = 0
         return label
     }()
    
    
   private lazy var askButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Allow", for: .normal)
       button.setTitleColor(AppColors.white, for: .normal)
       button.backgroundColor = AppColors.blue
       button.addTarget(self, action: #selector(allowTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var skipButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Skip", for: .normal)
        button.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
         return button
     }()
    
    
    
    
    
    init(permissionsType: PermissionsType) {
        self.permissionsType = permissionsType
        super.init(nibName: nil, bundle: nil)
        
        self.permisionText.text = permissionsType.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = AppColors.darkBlue
        
        setupUI()
        
       
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//            let long = self.locationService.currentLocation?.longitude
//            print(long ?? "333")
//        }
        
    }
    
   @objc func skipTapped() {
       switch permissionsType {
       case .push:
           break
       case .location:
//           DefaultsManager.isAskedForLocation = true
           skipped?()
           break
           
       }
        
    }
    
    
    @objc
    func allowTapped() {
        switch permissionsType {
        case .push:
//            registerForPushNotifications() {
//                self.userInfoService.changeAskPushValue()
//                DispatchQueue.main.async {
//                    self.skipTapped()
//                }
//            }
            break
        case .location:
            locationService.requestLocationUpdates()
        }
    }
    
    
    override func viewWillLayoutSubviews() {
      
        topLabel.layer.cornerRadius = min(topLabel.bounds.size.width, topLabel.bounds.size.height) / 10
        topLabel.clipsToBounds = true
        askButton.layer.cornerRadius = min(askButton.bounds.size.width, askButton.bounds.size.height) / 10
    }
  
    
    
    
    func setupUI() {
        view.addSubview(topLabel)
        view.addSubview(permisionText)
        view.addSubview(askButton)
        view.addSubview(skipButton)
        
        topLabel.snp.makeConstraints {
            $0.top.equalTo(view.snp.top).offset(250)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
            $0.height.equalTo(50)
        }
        
        permisionText.snp.makeConstraints {
            $0.top.equalTo(topLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(45)
            $0.right.equalToSuperview().offset(-45)
            $0.height.equalTo(50)
        }
        
        askButton.snp.makeConstraints {
            $0.bottom.equalTo(skipButton.snp.top).offset(-20)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
            $0.height.equalTo(50)
        }
        
        skipButton.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-150)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(20)
        }
        
    }
}

//MARK: DeviceLocationServiceDelegate

//extension AskPermisionsVS: DeviceLocationServiceDelegate {
//    
//    func didChangeLocationStatus() {
//        switch self.locationService.locationStatus {
//        case .authorizedWhenInUse, .authorizedAlways, .denied:
//            skipTapped()
//        default:
//            break
//        }
//    }
//    
//    func loacationDidChange(location: CLLocationCoordinate2D?) {
//        
//        return
//    }
//}
