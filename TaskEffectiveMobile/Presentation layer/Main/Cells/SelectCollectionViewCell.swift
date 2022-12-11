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
        let size = min(self.saleImageView.layer.frame.width , self.saleImageView.layer.frame.height)
        
//        self.saleImageView.layer.frame.height = size
       }
    
    var circularBGLayer: CALayer!

       override func awakeFromNib() {
           super.awakeFromNib()
          
//           backgroundColor = .clear
//           circularBGLayer = CALayer()
//           circularBGLayer.backgroundColor = AppColors.background.cgColor
//           layer.addSublayer(circularBGLayer)
       }

       override func layoutSubviews() {
           super.layoutSubviews()
           let size = min(self.saleImageView.layer.frame.width , self.saleImageView.layer.frame.height)
           
//           self.saleImageView.layer. = size
           
           self.saleImageView.layer.cornerRadius = size / 2
//           print( self.saleImageView.layer.frame.height)
//           print( self.saleImageView.layer.frame.width)
           print( self.contentView.layer.frame)
//           var frame = self.bounds
//           frame.size.width = min(frame.width, frame.height)
//           frame.size.height = frame.width
//           circularBGLayer.bounds = frame
//           circularBGLayer.cornerRadius = frame.width*0.5
//           circularBGLayer.position = CGPoint(x: frame.midX, y: frame.midY)
       }
    
    private lazy var saleImageView: UIImageView = {
        let imageView = UIImageView()
//        imageView.layer.borderWidth = 1.0
        imageView.layer.masksToBounds = true
        
//        imageView.layer.borderColor = UIColor.white.cgColor
//        imageView.layer.cornerRadius = self.contentView.layer.frame.size.height / 2
        imageView.clipsToBounds = true
//        imageView.backgroundColor = AppColors.orange
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
                layer.borderWidth = 0
                saleImageView.backgroundColor = AppColors.white
            }
        }
    }
    



    
    func setupView() {
        backgroundColor = .white
        addSubview(saleImageView)
        addSubview(saleLabel)
    }
    
   
    func configureCell(titleName:String, makeCurcle: Bool) {
        saleImageView.backgroundColor = AppColors.white
        saleLabel.text = titleName
       
//        saleImageView.image = UIImage(named: imageName)
    }
    
    
    func setConstraints() {
        
        saleImageView.snp.makeConstraints {
//            $0.top.equalToSuperview()
            $0.height.equalTo(self.saleImageView.snp.width)
//
            $0.bottom.equalTo(saleLabel.snp.top).inset(-7)
            
            
//            $0.top.equalToSuperview()
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
//            $0.bottom.equalToSuperview()
        }
        saleLabel.snp.makeConstraints {
            
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            
//            $0.top.equalToSuperview()
//            $0.left.equalToSuperview()
//            $0.right.equalToSuperview()
//            $0.bottom.equalToSuperview()
        }
        
//        NSLayoutConstraint.activate([
//            saleImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
//            saleImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            saleImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            saleImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
//        ])
    }
    
    
    
    
    
    
    
    
}

