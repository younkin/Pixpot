//
//  CountrySelection.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 12.01.23.
//

import Foundation
import UIKit
import Combine


enum LaunchInstructor {
    case countryVerify
    case webView
    case app
    
}

class LoadingScreenViewController: UIViewController {
    
    
    
    
    var appWay: ((LaunchInstructor) -> Void)?
  

    // MARK: - Properties
    let viewModel: LoadingScreenViewModel
    var canceballe = Set<AnyCancellable>()

    // MARK: - Init
    init(viewModel: LoadingScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var publicIP = "" {
        didSet {
            if publicIP == "1" {
                appWay?(.webView)
            }
            print(publicIP)
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        viewModel.getCountry(ip: "212.58.121.57")
        viewModel.countryData.sink { data in
            self.publicIP = data.data.tabs
        }.store(in: &canceballe)
        
       
    }
    
    
  
    
    
    
//    private func getCountry(ip: String?) {
//        networkService.getCountry(ip: ip) { [ weak self ] result in
//            guard let strongSelf = self else { return }
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let tab):
//                    strongSelf.routeToNextScreen(appWay: tab)
//                case .failure(let error):
//                    strongSelf.displayMsg(title: nil, msg: error.textToDisplay)
//                }
//            }
//        }
//    }
//
//    private func routeToNextScreen(appWay: AppWayByCountry) {
//        switch appWay {
//        case .toApp:
//            guard userInfoService.wasPushAsked()
//            else {
//                let enterVC = presentationAssembly.askPermissionsScreen(permissionType: .push(appWay: .toApp, link: nil))
//                setWindowRoot(enterVC)
//                return
//            }
//            homeOrEnterScreen()
//        case .web:
//            loadLink()
//        }
//    }
    
    
}
