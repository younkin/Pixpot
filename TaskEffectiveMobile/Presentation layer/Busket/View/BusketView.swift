//
//  BusketView.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import UIKit
import SnapKit
import Combine

final class BasketView: UIView {
    
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    private(set) lazy var customTable: CustomBasketTable = {
        var view = CustomBasketTable()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var mapButton = RoundedNavButton(image: UIImage(named: "MapBasket")!, color: AppColors.orange)
    
    private(set) lazy var backButton = RoundedNavButton(image: UIImage(named: "BasketBack")!, color: AppColors.darkBlue)
    
    private lazy var nameLabel :UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Cart"
        label.font = AppFont.markProFont(ofSize: 35, weight: .bold)
        label.textColor = AppColors.darkBlue
        return label
    }()
    
     init() {
        super.init(frame: .zero)
        
        backgroundColor = AppColors.white
        setupUI()
    }
    
    override func layoutSubviews() {
       super.layoutSubviews()
        
        backButton.layer.cornerRadius = backButton.frame.height / 4
        mapButton.layer.cornerRadius = mapButton.frame.height / 4
    }
    
    func startingActivityIndicator() {
        activityIndicator.startAnimating()
    }

    func stopActivityIndicator() {
        activityIndicator.stopAnimating()
        
    }
    
    func isHiddenCollectionView(isLoadingIndicator: Bool) {
        if isLoadingIndicator {
            customTable.alpha = 0
        } else {
            customTable.alpha = 1
        }
    }
    
    private func setupUI() {
        addSubview(backButton)
        addSubview(customTable)
        addSubview(mapButton)
        addSubview(nameLabel)
        addSubview(activityIndicator)
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(29)
            $0.leading.equalTo(self).offset(21)
            $0.width.height.equalTo(37)
        }
        
        mapButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(29)
            $0.trailing.equalTo(self).inset(21)
            $0.width.height.equalTo(37)
        }
        
        customTable.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(190)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(customTable.snp.top).offset(-25)
            $0.leading.equalTo(self).offset(21)
        }
        
        activityIndicator.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
