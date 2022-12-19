//
//  ProductInfoView.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 15.12.2022.
//

import Foundation
import UIKit
import SnapKit

final class ProductInfoView: UIView {
    
    private(set) lazy var nameLabel: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 24, weight: .medium)
        label.text = "Galaxy Note 20 Ultra"
        label.textColor = AppColors.darkBlue
        return label
    }()
    
    private lazy var starView1: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var starView2: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var starView3: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var starView4: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    private lazy var starView5: UIImageView = {
       var imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var starStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starView1, starView2, starView3, starView4, starView5])
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .equalSpacing
        stack.spacing = 9.0
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var imageView1: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = UIImage(named: "Proc")
        return imageView
    }()
    
    private lazy var imageView2: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = UIImage(named: "Camera")
        return imageView
    }()
    
    private lazy var imageView3: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = UIImage(named: "Ram")
        return imageView
    }()
    
    private lazy var imageView4: UIImageView = {
       var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        imageView.image = UIImage(named: "Mamory")
        return imageView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView1, imageView2, imageView3, imageView4])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        stack.spacing = 64
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var cpuLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 11, weight: .regular)
        label.text = "Exunos"
        label.textColor = AppColors.black.withAlphaComponent(0.5)
        return label
    }()
    
    private lazy var photoLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 11, weight: .regular)
        label.text = "Exunos"
        label.textColor = AppColors.black.withAlphaComponent(0.5)
        return label
    }()
    
    private lazy var ramLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 11, weight: .regular)
        label.text = "Exunos"
        label.textColor = AppColors.black.withAlphaComponent(0.5)
        return label
    }()
    
    private lazy var memoryLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 11, weight: .regular)
        label.text = "Exunos"
        label.textColor = AppColors.black.withAlphaComponent(0.5)
        return label
    }()
    
    private lazy var selectLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 16, weight: .medium)
        label.text = "Select color and capacity"
        label.textColor = AppColors.darkBlue
        return label
    }()
    
    private lazy var buyButton = ProductBuyButton()
    private(set) lazy var favouriteBTn = HeartButton()
    private lazy var detailsControl = DetailsControl()
    private(set) lazy var colorControl = ColorControl()
    private(set) lazy var ramControl = RamControl()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = AppColors.white
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = min(frame.width , frame.height)
        let radius: CGFloat = size / 13
        layer.cornerRadius = radius
        layer.borderColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 5.0
        layer.shadowOpacity = 0.3
        favouriteBTn.layer.cornerRadius = favouriteBTn.frame.height / 4
    }
    
    func setupView(colors: Array<String>, price: String, rating: Double, sd: String, ssd: String, capacity: Array<String>, isFavourite: Bool, camera: String, cpu: String) {
        colorControl.items = colors.map { UIColor.hexStringToUIColor(hex: $0)}
        buyButton.title2.text = "$" + price
        ramLbl.text = ssd
        memoryLbl.text = sd
        ramControl.items = capacity
        favouriteBTn.isSelected = isFavourite
        photoLbl.text = camera
        cpuLbl.text = cpu
        
        let ratingInt = Int(rating)
        let arrayView = [starView1, starView2, starView3, starView4, starView5]
        for i in 1...ratingInt {
            arrayView[i-1].image = UIImage(named: "StarField")
        }
        if Double(ratingInt) != rating {
            arrayView[ratingInt].image = UIImage(systemName: "star.leadinghalf.filled")
            arrayView[ratingInt].tintColor = AppColors.gold
        }
    }
    
    private func setupUI() {
        addSubview(nameLabel)
        addSubview(favouriteBTn)
        addSubview(starStackView)
        addSubview(detailsControl)
        addSubview(infoStackView)
        addSubview(cpuLbl)
        addSubview(photoLbl)
        addSubview(ramLbl)
        addSubview(memoryLbl)
        addSubview(selectLbl)
        addSubview(buyButton)
        addSubview(colorControl)
        addSubview(ramControl)
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(self).offset(38)
            $0.bottom.equalTo(starStackView.snp.top).offset(-7)
            $0.top.equalTo(self).offset(25)
        }
        
        favouriteBTn.snp.makeConstraints {
            $0.trailing.equalTo(self).inset(30)
            $0.centerY.equalTo(nameLabel.snp.centerY)
            $0.width.height.equalTo(37)
        }
        
        starStackView.snp.makeConstraints {
            $0.leading.equalTo(nameLabel.snp.leading)
            $0.bottom.equalTo(detailsControl.snp.top).offset(-30)
        }
        
        detailsControl.snp.makeConstraints {
            $0.centerX.equalTo(self.snp.centerX)
            $0.bottom.equalTo(infoStackView.snp.top).offset(-30)
            }
        
        infoStackView.snp.makeConstraints {
            $0.leading.equalTo(self).offset(45)
            $0.trailing.equalTo(self).inset(45)
            $0.bottom.equalTo(cpuLbl.snp.top).offset(-5)
        }
        
        cpuLbl.snp.makeConstraints {
            $0.centerX.equalTo(imageView1.snp.centerX)
            $0.bottom.equalTo( selectLbl.snp.top).offset(-20)
        }
        
        photoLbl.snp.makeConstraints {
            $0.centerX.equalTo(imageView2.snp.centerX)
            $0.centerY.equalTo(cpuLbl.snp.centerY)
        }
        
        ramLbl.snp.makeConstraints {
            $0.centerX.equalTo(imageView3.snp.centerX)
            $0.centerY.equalTo(cpuLbl.snp.centerY)
        }
        
        memoryLbl.snp.makeConstraints {
            $0.centerX.equalTo(imageView4.snp.centerX)
            $0.centerY.equalTo(cpuLbl.snp.centerY)
        }
        
        selectLbl.snp.makeConstraints {
            $0.leading.equalTo(cpuLbl.snp.leading)
            $0.bottom.equalTo(colorControl.snp.top).offset(-12)
        }
        
        buyButton.snp.makeConstraints {
            $0.bottom.equalTo(self).inset(10)
            $0.leading.equalTo(self).offset(29)
            $0.trailing.equalTo(self).inset(29)
            $0.height.equalTo(54)
        }
        
        colorControl.snp.makeConstraints {
            $0.bottom.equalTo(buyButton.snp.top).offset(-10)
            $0.leading.equalTo(buyButton.snp.leading)
            $0.height.equalTo(39)
            $0.trailing.equalTo(self).inset(200)
        }
        
        ramControl.snp.makeConstraints {
            $0.centerY.equalTo(colorControl.snp.centerY)
            $0.trailing.equalTo(self).inset(40)
            $0.height.equalTo(30)
            $0.width.equalTo(150)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
