//
//  ProductsCollectionViewCell.swift
//  Sarawan
//
//  Created by Евгений Юнкин on 22.12.22.
//


import UIKit
import SDWebImage


class ProductsCollectionViewCell: UICollectionViewCell {
    
    private let BackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let discriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории, Сахар, молоко!"
        label.textAlignment = .left
        label.numberOfLines = 0
        
        label.font = AppFont.markProFont(ofSize: 12, weight: .medium)
        label.textColor = AppColors.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    // MARK: - Init
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
        backgroundColor = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = min(BackgroundImageView.layer.frame.width , BackgroundImageView.layer.frame.height)
        BackgroundImageView.layer.cornerRadius = size / 10
        BackgroundImageView.layer.masksToBounds = true
    }
    
    func setupView() {
   addSubview(BackgroundImageView)
        BackgroundImageView.addSubview(discriptionLabel)
    }
    
    func configureCell(imageString: String, productTitle: String) {
//        self.BackgroundImageView.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: "icDefaultFood"))
        self.BackgroundImageView.image = UIImage(named: imageString)
        self.discriptionLabel.text = productTitle
    }
    

//MARK: Constraints
    func setConstraints() {
        BackgroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        discriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(16)
            $0.width.equalToSuperview().multipliedBy(0.7)
            
        }
    }
}


