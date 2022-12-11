//
//  SelectCollectionViewCell.swift
//  TaskEffectiveMobile
//
//  Created by Евгений Юнкин on 11.12.22.
//

import UIKit
import SnapKit

class SelectCollectionViewCell: UICollectionViewCell {
    
    override func draw(_ rect: CGRect) {
           super.draw(rect)

       }
    
    var circularBGLayer: CALayer!

       override func awakeFromNib() {
           super.awakeFromNib()
          

       }

       override func layoutSubviews() {
           super.layoutSubviews()
           let size = min(self.saleImageView.layer.frame.width , self.saleImageView.layer.frame.height)
           self.saleImageView.layer.cornerRadius = size / 2
//           print( self.contentView.layer.frame)

       }
    
    private lazy var saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true

        return imageView
    }()
    
    private var iconImage: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    private let saleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 10)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = AppColors.background
  
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool {
        didSet{
            if isSelected {
                saleImageView.backgroundColor = AppColors.orange

            } else {
              
                saleImageView.backgroundColor = AppColors.white
            }
        }
    }
    



    
    func setupView() {
        backgroundColor = .white
        addSubview(saleImageView)
        addSubview(saleLabel)
        saleImageView.addSubview(iconImage)
    }
    
   
    func configureCell(titleName:String, iconLink: String) {
        saleImageView.backgroundColor = AppColors.white
        saleLabel.text = titleName
        iconImage.image = UIImage(named: iconLink)

    }
    
    
    func setConstraints() {
        
        saleImageView.snp.makeConstraints {

            $0.height.equalTo(self.saleImageView.snp.width)
            $0.bottom.equalTo(saleLabel.snp.top).inset(-7)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
        }
        saleLabel.snp.makeConstraints {
            
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            
        }
        iconImage.snp.makeConstraints {
            
            $0.center.equalToSuperview()
           
            
        }
        

    }
    
    
    
    
    
    
    
    
}

