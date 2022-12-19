//
//  CustomBasketTable.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 11.12.2022.
//

import Foundation
import UIKit
import SnapKit
import Combine

final class CustomBasketTable: UIView {
    
    var basket: [Products] = []
    
    var deleteProduct: ((IndexPath)->Void)?
    var reloadCount: ((Int, Int)->Void)?
    let cellTouch = PassthroughSubject<Void, Never>()
    
    // MARK: - Private variables
    private(set) lazy var basketTableView: UITableView = {
       var table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = AppColors.darkBlue
        table.register(BasketTableViewCell.self, forCellReuseIdentifier: "BasketCell")
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.backgroundColor = .clear
        return table
    }()
    private lazy var separatorImage1: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "BusketLine1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var separatorImage2: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "BusketLine1")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    

    private lazy var totalLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total"
        label.font = AppFont.markProFont(ofSize: 15, weight: .medium)
        label.textColor = AppColors.white
        return label
    }()
    
    private lazy var delivaryLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Delivary"
        label.font = AppFont.markProFont(ofSize: 15, weight: .medium)
        label.textColor = AppColors.white
        return label
    }()
    
     lazy var totalCostLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "$89,000 us"

        label.font = AppFont.markProFont(ofSize: 15, weight: .bold)

        label.textColor = AppColors.white
        return label
    }()
    
     lazy var delivaryCostLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false

        label.text = "Placeholder"

        label.font = AppFont.markProFont(ofSize: 15, weight: .bold)

        label.textColor = AppColors.white
        return label
    }()
    
    private(set) lazy var deliveryBtn: UIButton = {
       var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Checkout", for: .normal)
        button.titleLabel?.textColor = AppColors.white
        button.backgroundColor = AppColors.orange
        button.titleLabel?.font = AppFont.markProFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    private lazy var labelsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalLabel , delivaryLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var labelsStackViewTotal: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalCostLbl, delivaryCostLbl])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalSpacing
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)

        basketTableView.dataSource = self
        basketTableView.delegate = self
        
        backgroundColor = AppColors.darkBlue
        setupUI()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = min(frame.height, frame.width)
        layer.cornerRadius = size / 15
        deliveryBtn.layer.cornerRadius = deliveryBtn.frame.width / 17
        
       
    }
    
    private func setupUI() {
        addSubview(basketTableView)
        addSubview(separatorImage1)
        addSubview(separatorImage2)
        addSubview(deliveryBtn)
        addSubview(labelsStackView)
        addSubview(labelsStackViewTotal)
        
        basketTableView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(25)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(separatorImage1.snp.top).offset(-5)
        }
        
        separatorImage1.snp.makeConstraints {
            $0.leading.equalTo(self).offset(4)
            $0.trailing.equalTo(self).inset(4)
            $0.bottom.equalTo(labelsStackViewTotal.snp.top).offset(-15)
        }
        
        labelsStackViewTotal.snp.makeConstraints {
            $0.bottom.equalTo(separatorImage2.snp.top).offset(-26)
            $0.centerX.equalTo(self).offset(120)
        }
        
        labelsStackView.snp.makeConstraints {
            $0.bottom.equalTo(separatorImage2.snp.top).offset(-26)
            $0.leading.equalTo(self).offset(55)
        }
        
        separatorImage2.snp.makeConstraints {
            $0.leading.equalTo(self).offset(4)
            $0.trailing.equalTo(self).inset(4)
            $0.bottom.equalTo(deliveryBtn.snp.top).offset(-25)
        }
        
        deliveryBtn.snp.makeConstraints {
            $0.leading.equalTo(self).offset(44)
            $0.trailing.equalTo(self).inset(44)
            $0.height.equalTo(54)
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomBasketTable: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cellTouch.send()
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
  
}

extension CustomBasketTable: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  124
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(basket.count)
        return basket.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BasketTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as? BasketTableViewCell else { return UITableViewCell() }

        let product = basket[indexPath.row]

        cell.setupCell(title: product.title, image: product.images, price: String(product.price), indexPath: indexPath)
        
        cell.cancellable = cell.tapDeleteBtn.sink { [weak self] index in
            self?.deleteProduct?(index!)
        }
        
        cell.quantityButton.cancellable2 =  cell.quantityButton.reloadCount.sink(receiveValue: { [weak self] count in
            self?.reloadCount?(count,indexPath.row)
        })
            
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
}
