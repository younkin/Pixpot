//
//  UIView + Ext.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 15.01.23.
//
import UIKit

//extension UIView {
//    func setGradientBackground(startColor: UIColor, endColor: UIColor) {
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
//        gradientLayer.frame = contentView.bounds
//        layer.insertSublayer(gradientLayer, at: 0)
//    }
//}
extension UICollectionViewCell {
    func setGradientBackground(startColor: UIColor, endColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.frame = contentView.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
