//
//  BusketView.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class BasketView: UIView {
    
    let viewModel: BasketViewModel
    
    private(set) lazy var customTable: CustomBasketTable = {
       var view = CustomBasketTable()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) lazy var backButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "BasketBack"), for: .normal)
        button.backgroundColor = AppColors.darkBlue
        button.tintColor = AppColors.white
        return button
    }()
    
    private(set) lazy var mapButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "MapBasket"), for: .normal)
        button.backgroundColor = AppColors.orange
        button.tintColor = AppColors.white
        return button
    }()
    
    private lazy var nameLabel :UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "My Cart"
        label.font = AppFont.montserratFont(ofSize: 35, weight: .bold)
        label.textColor = AppColors.darkBlue
        return label
    }()
    
    
    
    init(viewModel: BasketViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = AppColors.white
        backButton.layer.cornerRadius = backButton.frame.height / 4
        mapButton.layer.cornerRadius = mapButton.frame.height / 4
        setupUI()
    }
    
    private func setupUI() {
        addSubview(backButton)
        addSubview(customTable)
        addSubview(mapButton)
        addSubview(nameLabel)
        
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
    }
}

extension BasketView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  124
    }
  
}

extension BasketView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: BasketTableViewCell  = tableView.dequeueReusableCell(withIdentifier: "BasketCell", for: indexPath) as? BasketTableViewCell else { return UITableViewCell() }
        return cell
    }
    
//    private func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return UITableView.automaticDimension
//        }
//        return 0
//    }
    

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            guard let footer: BusketTableViewFooter = tableView.tableFooterView as? BusketTableViewFooter else {
                return UIView()
            }
            return footer
    }
    
    

}
