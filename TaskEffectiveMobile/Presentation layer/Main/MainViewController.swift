//
//  MainView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 07.12.22.
//

import UIKit
import Combine

class MainViewController: UIViewController {
    
    

    var mainViewModel: MainViewModel
    

    
    private let sections = MockData.shared.pageData

    lazy var storeView = self.view as? MainView
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    
    
   
    init(mainViewModel: MainViewModel) {
        self.mainViewModel = mainViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    // MARK: - View lifecycle
    override func loadView() {
        super.loadView()
        let view = MainView()
        self.view = view
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

   
    
    

    
    
  


}









