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
    var subscriptions = Set<AnyCancellable>()
    var showFilter: ((Bool) -> Void)?
    var showDitailProduct: ((Int) -> Void)?
    private let sections = MockData.shared.pageData
    lazy var mainView = self.view as? MainView
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        getData()
        
        mainView?.filterButton.tapPublisher.sink(receiveValue: { _ in
            self.showFilter!(true)
        }).store(in: &subscriptions)
        
        mainView?.bestSellTapped = {[weak self] IndexPath in
            self?.showDitailProduct!(IndexPath)
        }
        
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

    func getData() {
        mainViewModel.getMain()
        
        mainViewModel.mainData.sink(receiveCompletion: { completion in
            switch completion {
            case .failure(let error):
                print("Error with \(error)")
            case .finished:
                print("Success!")
            }
        }, receiveValue: { [weak self] mainData in
            DispatchQueue.main.async {
                self?.mainView?.mainData = mainData
                self?.mainView?.collectionView.reloadData()
                
            }
        }).store(in: &subscriptions)
    }
    
}









