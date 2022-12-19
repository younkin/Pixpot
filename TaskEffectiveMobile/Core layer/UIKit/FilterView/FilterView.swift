//
//  FilterView.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 18.12.22.
//

import UIKit


class FilterView: UIView {
    
    lazy var brands: Array<String> = []
    lazy var minPrice: Int = 0
    lazy var maxPrice: Int = 100000000
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Filter options"
        label.textColor = AppColors.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private(set) lazy var backButton = RoundedNavButton(image: UIImage(named: "FilterClouse")!, color: AppColors.darkBlue)
    private(set) lazy var doneButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.setTitleColor(AppColors.white, for: .normal)
        button.setTitleColor(AppColors.orange, for: .highlighted)
        button.backgroundColor = AppColors.orange
        return button
    }()
    
    private lazy var brandLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 18, weight: .medium)
        label.text = "Brand"
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    lazy var brandBtn: DropDownButtonBrand = {
       var button = DropDownButtonBrand()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Brand", for: .normal)
        button.dropView.dropDownOptions = ["Blue", "Green", "Magenta", "White", "Black", "Pink"]
        return button
    }()
    
    private lazy var priceLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 18, weight: .medium)
        label.text = "Price"
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    lazy var priceBtn: DropDownButtonPrice = {
        var button = DropDownButtonPrice()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Price", for: .normal)
        return button
    }()
    
    private lazy var sizeLbl: UILabel = {
       var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = AppFont.markProFont(ofSize: 18, weight: .medium)
        label.text = "Size"
        label.contentMode = .scaleAspectFill
        return label
    }()
    
    private lazy var sizeBtn = SizeButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
      
       layer.shadowColor = UIColor.black.cgColor
       layer.shadowOpacity = 1
       layer.shadowOffset = .zero
       layer.shadowRadius = 10
        
        addViews()
        makeConstraints()
        backgroundColor = AppColors.background
        stackView.backgroundColor = AppColors.background
        
        priceBtn.dropView.valueChange = { [weak self] cost in
            let string = "$300 - $" + String(cost)
            self?.priceBtn.setTitle(string, for: .normal)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = minSize(object: self) / 18
        doneButton.layer.cornerRadius = 8
        stackView.layer.cornerRadius = minSize(object: stackView) / 4
    }
    
    
    func minSize(object: AnyObject) -> CGFloat {
       return min(object.layer.frame.width , object.layer.frame.height)
    }
    
    func addViews() {
        addSubview(stackView)
        addSubview(brandLbl)
        addSubview(brandBtn)
        addSubview(priceLbl)
        addSubview(priceBtn)
        addSubview(sizeLbl)
        addSubview(sizeBtn)
    
        sendSubviewToBack(priceLbl)
        sendSubviewToBack(priceBtn)
        sendSubviewToBack(sizeLbl)
        sendSubviewToBack(sizeBtn)
        
       stackView.addSubview(backButton)
       stackView.addSubview(titleLabel)
       stackView.addSubview(doneButton)
    }
    
    
    func makeConstraints() {
        
        
        stackView.snp.makeConstraints {
//            $0.top.equalTo(safeAreaLayoutGuide)
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
            $0.height.equalTo(70)
        }
        backButton.snp.makeConstraints {
            $0.left.equalToSuperview().offset(44)
            $0.centerY.equalTo(stackView.snp.centerY)
            $0.width.height.equalTo(37)
        }
        titleLabel.snp.makeConstraints {
            $0.center.equalTo(stackView.snp.center)
            $0.width.equalTo(114)
            $0.height.equalTo(24)
        }
        doneButton.snp.makeConstraints {
//            $0.centerY.equalTo(stackView.snp.centerY)
            $0.right.equalToSuperview().offset(-20)
            $0.right.equalTo(self).offset(-20)
            $0.width.equalTo(86)
            $0.height.equalTo(37)
        }
        
        brandLbl.snp.makeConstraints {
            $0.top.equalTo(backButton.snp.bottom).offset(20)
            $0.leading.equalTo(self).offset(46)
        }

        brandBtn.snp.makeConstraints {
            $0.top.equalTo(brandLbl.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
            $0.trailing.equalTo(self).inset(31)
            $0.height.equalTo(37)
        }
        
        priceLbl.snp.makeConstraints {
            $0.top.equalTo(brandBtn.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
        }
        
        priceBtn.snp.makeConstraints {
            $0.top.equalTo(priceLbl.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
            $0.trailing.equalTo(self).inset(31)
            $0.height.equalTo(37)
        }
        
        sizeLbl.snp.makeConstraints {
            $0.top.equalTo(priceBtn.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
        }
        
        sizeBtn.snp.makeConstraints {
            $0.top.equalTo(sizeLbl.snp.bottom).offset(10)
            $0.leading.equalTo(self).offset(46)
            $0.trailing.equalTo(self).inset(31)
            $0.height.equalTo(37)
        }
    }
    
    
}
