//
//  FilterPriceButton.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 19.12.2022.
//

import UIKit


protocol dropDownProtocol {
    func dropDownPressed(string : String)
}

final class DropDownButtonPrice: UIButton, dropDownProtocol {
    
    func dropDownPressed(string: String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    var dropView = DropDownView1()
    
    var height = NSLayoutConstraint()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = AppColors.white
        self.titleLabel?.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).offset(15)
            $0.width.equalTo(150)
        }
        self.setTitleColor(AppColors.darkBlue, for: .normal)
        self.setImage(UIImage(named: "FilterDrop"), for: .normal)
        self.imageView?.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.trailing.equalTo(self).inset(15)
            $0.width.equalTo(16)
            $0.height.equalTo(8)
        }
        
        dropView = DropDownView1.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        //dropView = DropDownView1()
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
        dropView.isHidden = true
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            
            height.constant = 50
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.isHidden = false
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
                self.dropView.isHidden = true
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
            
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
            self.dropView.isHidden = true
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size = min(self.frame.width, self.frame.height)
        self.layer.cornerRadius = size / 7
        self.layer.borderWidth = 1
        self.layer.borderColor = AppColors.grey.withAlphaComponent(0.1).cgColor
    }
}

class DropDownView1: UIView  {
    
    var dropDownOptions = [String]()
    
    var valueChange: ((Int)->Void)?
    
    var delegate : dropDownProtocol!
    
    var maxPrice: Int = 1000
    
    private(set) lazy var slider: UISlider = {
       var slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.minimumValue = 300
        slider.maximumValue = 10000
        slider.value = 500
        slider.thumbTintColor = AppColors.darkBlue
        slider.tintColor = AppColors.orange
        slider.isContinuous = true
        slider.isSelected = true
        return slider
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    
        self.backgroundColor = AppColors.white

        addSubview(slider)
        
        slider.snp.makeConstraints {
            $0.centerY.equalTo(self)
            $0.leading.equalTo(self).offset(10)
            $0.trailing.equalTo(self).offset(-10)
            $0.height.equalTo(30)
        }
        
        slider.addTarget(self, action: #selector(self.sliderValueDidChange(_:)), for: .valueChanged)
    
    }
    
    @objc private func sliderValueDidChange(_ sender:UISlider!) {
        let value = Int(sender.value)
        valueChange?(value)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        slider.isSelected = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
