//
//  RoundedNavButton.swift
//  TaskEffectiveMobile
//
//  Created by Admin on 14.12.2022.
//

import Foundation
import UIKit

final class RoundedNavButton: UIButton {
    
  private var icon: UIImageView = {
        let icon = UIImageView()
        icon.backgroundColor = .clear
        return icon
    }()
    
    init(image: UIImage, color: UIColor) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = color
        self.icon.image = image
        addSubview(self.icon)
        makeIconConstrate()
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        setImage(UIImage(named: "MapBasket"), for: .normal)
    }
    
    override func layoutSubviews() {
        let size = min(layer.frame.width , layer.frame.height)
        layer.cornerRadius = size / 4
       
    }
    
    func makeIconConstrate() {
        icon.snp.makeConstraints {
            $0.center.equalTo(self.snp.center)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
