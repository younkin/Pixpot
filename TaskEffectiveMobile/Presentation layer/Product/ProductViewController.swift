//
//  ProductViewController.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 14.12.2022.
//

import Foundation
import UIKit
import Combine

final class ProductViewController: UIViewController  {
    
    private var cancellable = Set<AnyCancellable>()
    let productViewModel: ProductViewModel
    private lazy var productView = self.view as? ProductView
    
    init(viewModel: ProductViewModel) {
        self.productViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        let productView = ProductView()
        self.view = productView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productViewModel.getProduct()
        setupBindings()
        
        
    }
    
    private func setupBindings() {
        productViewModel.product.sink(receiveValue: { [weak self] product in
            DispatchQueue.main.async {
                guard let view = self?.productView else { return }
                view.product = product
                //view.infoView.colorControl.items = product.color.map { UIColor.hexStringToUIColor(hex: $0) }
                view.infoView.setupView(colors: product.color, price: String(product.price), rating: product.rating, sd: product.sd, ssd: product.ssd, capacity: product.capacity, isFavourite: product.isFavorites, camera: product.camera, cpu: product.cpu)
                view.collectionView.reloadData()
            }
        }).store(in: &cancellable)
        
        productView?.backButton.tapPublisher
            .sink(receiveValue: { [weak self] in
                self?.productViewModel.isFinish?()
            }).store(in: &cancellable)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
