//
//  sheduleCustomCell.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//





import UIKit
import SDWebImage


class sheduleCustomCell: UICollectionViewCell {
    
   

    private let BackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private let sportImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        return image
    }()
    private let headLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 12, weight: .medium)
        label.textColor = AppColors.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

 
    // MARK: - Init
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.setGradientBackground(startColor: AppColors.blue, endColor: AppColors.green)
        backgroundColor = .black
        setupView()
        setConstraints()
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = min(BackgroundImageView.layer.frame.width , BackgroundImageView.layer.frame.height)
        BackgroundImageView.layer.cornerRadius = size / 10
        BackgroundImageView.layer.masksToBounds = true
        self.layer.cornerRadius = size / 10
        self.layer.masksToBounds = true
        self.contentView.layer.cornerRadius = 20
        self.contentView.clipsToBounds = true
    }
    
    func setupView() {
   addSubview(BackgroundImageView)
        
        BackgroundImageView.addSubview(headLabel)
        BackgroundImageView.addSubview(sportImage)
    }
    
    func configureCell(imageString: String, headLabel: String) {
//        self.BackgroundImageView.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: "icDefaultFood"))
//        self.BackgroundImageView.image = UIImage(named: imageString)
       
        self.sportImage.image = UIImage(named: imageString)
        self.headLabel.text = headLabel
    }
    

//MARK: Constraints
    func setConstraints() {
        
        BackgroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        sportImage.snp.makeConstraints {
            $0.height.equalTo(100)
            $0.width.equalTo(100)
            $0.right.equalToSuperview().offset(5)
            $0.bottom.equalToSuperview().offset(20)
        }
        
        headLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(10)
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
      
        
    }
}




