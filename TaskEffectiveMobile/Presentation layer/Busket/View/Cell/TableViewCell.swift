//
//  TableViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 09.12.2022.
//

import Foundation
import UIKit
import SnapKit
import SDWebImage
import Combine

 class BasketTableViewCell: UITableViewCell {
    
     let tapDeleteBtn = PassthroughSubject<IndexPath?, Never>()
     var cancellable: AnyCancellable?
     var index: IndexPath?
     
    private lazy var nameLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 20, weight: .medium)
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.text = ""
        label.minimumScaleFactor = 0.2
        label.sizeToFit()
        return label
    }()
     
     private lazy var priceLabel: UILabel = {
         var label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.font = AppFont.markProFont(ofSize: 25, weight: .medium)
          label.textColor = AppColors.orange
          label.numberOfLines = 0
          label.text = ""
          label.minimumScaleFactor = 0.2
          label.sizeToFit()
          return label
     }()
    
    private lazy var productImage: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(named: "busket")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.clipsToBounds = true
        return imageView
    }()
     
     private(set) lazy var trashButton: UIButton = {
         let button = UIButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = .clear
         button.setImage(UIImage(named: "Trash"), for: .normal)
         button.tintColor = AppColors.grey
         button.addTarget(self, action: #selector(deleteBtnTpd), for: .touchUpInside)
         return button
     }()
     
      lazy var quantityButton:  QuantityButton = {
        let button = QuantityButton()
         button.translatesAutoresizingMaskIntoConstraints = false
         return button
     }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        setupUI()
        
        quantityButton.cancellable = quantityButton.zeroCount.sink(receiveValue: { [weak self] in
            self?.tapDeleteBtn.send(self?.index)
        })
        
    }
     
     override func layoutIfNeeded() {
         super.layoutIfNeeded()
         productImage.layer.cornerRadius = productImage.frame.height / 5
         print(productImage.frame.height)
     }
     
     func setupCell(title: String, image: String, price: String, indexPath: IndexPath) {
         nameLabel.text = title
         priceLabel.text = price
         productImage.sd_setImage(with: URL(string: image))
         index = indexPath
     }
    
     @objc func deleteBtnTpd() {
         print("delete")
         tapDeleteBtn.send(index)
     }
     
     
    private func setupUI() {
        contentView.addSubview(productImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(quantityButton)
        contentView.addSubview(trashButton)
        
        productImage.sd_setImage(with: URL(string: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg1"))
        productImage.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(22)
            $0.leading.equalTo(contentView).offset(23)
            $0.height.equalTo(80)
            $0.width.equalTo(80)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(22)
            $0.leading.equalTo(productImage.snp.trailing).offset(14)
            $0.bottom.equalTo(priceLabel.snp.top)
            $0.width.equalTo(143)
        }
        
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalTo(productImage.snp.trailing).offset(14)
            $0.bottom.equalTo(productImage.snp.bottom)
            $0.height.equalTo(25)
        }
        
        quantityButton.snp.makeConstraints {
            $0.centerY.equalTo(contentView)
            $0.height.equalTo(68)
            $0.width.equalTo(26)
            $0.trailing.equalTo(trashButton.snp.leading).offset(-17)
        }
        
        trashButton.snp.makeConstraints {
            $0.centerY.equalTo(quantityButton.snp.centerY)
            $0.height.equalTo(18)
            $0.trailing.equalTo(self).inset(30)
        }
        
    }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
}

