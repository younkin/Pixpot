//
//  BestSellerCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit
class BestSellerCollectionViewCell: UICollectionViewCell {
    
    let stackView = UIStackView()
    
    private let bestSellerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage (named: "iphone-13")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var isFavorite: UIButton = {
        let icon = UIButtonRounded(icon: UIImage(named: "heart"))
        return icon
    }()
//    private let backgroundTitleView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.alpha = 0.6
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    private let productDiscription: UILabel = {
        let label = UILabel ()
        label.text = "Sumsung note 20 Ultra"
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size: 10)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountedPrice: UILabel = {
        let label = UILabel ()
        label.text = "$400"
        label.textAlignment = .center
        label.font = AppFont.markProFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private let fullPrice: UILabel = {
        let label = UILabel ()
        label.text = "$1500"
        label.textAlignment = .left
        label.font = AppFont.markProFont(ofSize: 10, weight: .regular)
        label.textColor = .black
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.attributedText = "$1500".strikeThrough()
        label.alpha = 0.8
//        label.attributedText = NSAttributedString(string: "Text", attributes:
//            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        return label
    }()
    
    
//    private let priceLabel: UILabel = {
//        let label = UILabel ()
//        label.text = "$7.42"
//        label.textAlignment = .center
//        label.font = UIFont (name: "Arial Bold", size: 24)
//        label.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError ("init (coder:) has not been implemented")
    }
    
    
    
    func setupView() {
        
        stackView.axis = .horizontal
        stackView.alignment = .center // .Leading .FirstBaseline .Center .Trailing .LastBaseline
//        stackView.distribution = .equalCentering // .FillEqually .FillProportionally .EqualSpacing .EqualCentering
        
        
        
        self.isUserInteractionEnabled = true
        clipsToBounds = true
        layer.cornerRadius = 10
        backgroundColor = AppColors.white
        addSubview (bestSellerImage)
        bestSellerImage.isUserInteractionEnabled = true
        bestSellerImage.addSubview(isFavorite)
        addSubview (productDiscription)
        addSubview(stackView)
        stackView.addArrangedSubview(discountedPrice)
        stackView.addArrangedSubview(fullPrice)
//        addSubview (discountedPrice)
//        addSubview (fullPrice)
    }
    
    func configureCell(imageName: String) {
//        burgerImageView.image = UIImage(named: imageName)
    }
    
    
    
    
    func setConstraints() {
        
        
        bestSellerImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(stackView.snp.top)
        }
        
        stackView.snp.makeConstraints {
            
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalTo(productDiscription.snp.top)
            $0.height.equalTo(20)
        }
        
        discountedPrice.snp.makeConstraints {
            $0.bottom.equalTo(stackView.snp.bottom)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalToSuperview()
            $0.width.equalTo(40)
        }
        fullPrice.snp.makeConstraints {
            
            $0.left.equalTo(discountedPrice.snp.right).offset(2)
            $0.bottom.equalTo(stackView.snp.bottom)
            $0.height.equalToSuperview().multipliedBy(0.8)
            $0.width.equalTo(40)
        }
        
        
        
        
//        discountedPrice.snp.makeConstraints {
//            $0.left.equalTo(self)
//            $0.right.equalTo(fullPrice.snp.left)
//            $0.bottom.equalTo(productDiscription.snp.top)
//            $0.height.equalTo(20)
//
//
//
//        }
//        fullPrice.snp.makeConstraints {
////            $0.left.equalTo(fullPrice.snp.right)
//            $0.right.equalToSuperview()
//            $0.bottom.equalTo(productDiscription.snp.top)
//            $0.height.equalTo(20)
//
//        }
        
        productDiscription.snp.makeConstraints {
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
            $0.height.equalTo(30)
        }
        
        isFavorite.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.right.equalToSuperview().inset(12)
            $0.width.height.equalTo(25)
//            $0.right.equalToSuperview()
//            $0.bottom.equalToSuperview()
        }
        
    }
}

