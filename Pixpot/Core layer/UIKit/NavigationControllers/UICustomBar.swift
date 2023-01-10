//
//  File.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 10.01.23.
//

//import Foundation
//class CustomNavView: UIView {
//
//
//    init (barTitle: String, contactDiscription: String, barImage: String) {
//
//
//    }
//
//
//        view.frame = CGRect(x: 0, y: 0, width: 280, height: 40)
//
//        let imageContact = UIImageView()
//        imageContact.image = UIImage(named: barImage)
//        imageContact.layer.cornerRadius = imageContact.frame.height / 2
//        imageContact.frame = CGRect(x: 55, y: 0, width: 40, height: 40)
//        view.addSubview(imageContact)
//
//        let nameLabel = UILabel()
//        nameLabel.text = barTitle
//        nameLabel.frame = CGRect(x: 55, y: 0, width: 220, height: 20)
//        nameLabel.font = AppFont.markProFont(ofSize: 15, weight: .regular)
//        view.addSubview(nameLabel)
//
//        let discriptionLabel = UILabel()
//        discriptionLabel.text = contactDiscription
//        discriptionLabel.frame = CGRect(x: 55, y: 21, width: 220, height: 20)
//        discriptionLabel.font = AppFont.markProFont(ofSize: 15, weight: .regular)
//        discriptionLabel.textColor = AppColors.white
//        view.addSubview(discriptionLabel)
//
//
////    func createCustomButton(imageName: String, selector: Selector) -> UIBarButtonItem {
////        let button = UIButton(type: .system)
////        button.setImage(
////            UIImage(named: imageName)?.withRenderingMode(.alwaysTemplate),
////            for: .normal
////        )
////        button.tintColor = AppColors.white
////        button.imageView?.contentMode = .scaleAspectFit
////        button.contentVerticalAlignment = .fill
////        button.contentHorizontalAlignment = .fill
////        button.addTarget(self, action: selector, for: .touchUpInside)
////
////        let menuBarItem = UIBarButtonItem(customView: button)
////
////
////
////    }
//
//
//}

import UIKit
import SnapKit

class UICustomBar: UIView {
    
    
   private let imageContact: UIImageView = {
        let image = UIImageView()
        return image
    }()
            
           
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 16, weight: .heavy)
        label.textColor = AppColors.white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(imageContact)
        addSubview(titleLabel)

        // Configure the image view
        imageContact.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(8)
            $0.top.equalToSuperview().inset(8)
            $0.width.height.equalTo(50)
            
        }

        // Configure the title label
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageContact.snp.trailing).offset(8)
            $0.top.equalToSuperview().inset(8)
            $0.bottom.equalToSuperview().inset(8)
            $0.trailing.equalToSuperview().inset(8)
        }
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String, imageName: String){
        titleLabel.text = title
        imageContact.image = UIImage(named: imageName)
    }
}
