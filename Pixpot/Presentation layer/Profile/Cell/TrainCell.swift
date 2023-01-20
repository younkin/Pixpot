//
//  TrainCell.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//





import UIKit
import SDWebImage
import Combine


class TrainCell: UICollectionViewCell {
    
    let tapDeleteBtn = PassthroughSubject<IndexPath?, Never>()
    var cancellable: AnyCancellable?
    var index: IndexPath?
    
    private var dateTitle: UILabel = {
        let title = UILabel()
        title.text = ""
        title.backgroundColor = AppColors.darkBlue
        title.textColor = AppColors.white
        return title
    }()
    
    private let BackgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        
        return imageView
    }()
    private let sportImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        image.isUserInteractionEnabled = true
        return image
    }()
    private lazy var deleteButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "deleteIcon"), for: .normal)
        button.setTitleColor(AppColors.white, for: .highlighted)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        return button
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
    
    private let discriptionLabel: UILabel = {
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
        self.isUserInteractionEnabled = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = min(BackgroundImageView.layer.frame.width , BackgroundImageView.layer.frame.height)
        BackgroundImageView.layer.cornerRadius = size / 10
        BackgroundImageView.layer.masksToBounds = true
        
        self.contentView.layer.cornerRadius = 20
        self.contentView.clipsToBounds = true
    }
    
    @objc func tap() {
        print("tap11")
        tapDeleteBtn.send(index)
    }
    
    func setupView() {
   addSubview(BackgroundImageView)
        addSubview(dateTitle)
        BackgroundImageView.addSubview(headLabel)
        BackgroundImageView.addSubview(discriptionLabel)
        BackgroundImageView.addSubview(sportImage)
    addSubview(deleteButton)
        self.bringSubviewToFront(deleteButton)
        
    }
    
    func configureCell(imageString: String, productTitle: String, headLabel: String,date: Date, indexPath: IndexPath) {
//        self.BackgroundImageView.sd_setImage(with: URL(string: imageString), placeholderImage: UIImage(named: "icDefaultFood"))
//        self.BackgroundImageView.image = UIImage(named: imageString)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd HH:mm"
        let dateString = formatter.string(from: date)
        
        self.dateTitle.text = dateString
        self.sportImage.image = UIImage(named: imageString)
        self.discriptionLabel.text = productTitle
        self.headLabel.text = headLabel
        index = indexPath
    }
    

//MARK: Constraints
    func setConstraints() {
        
        dateTitle.snp.makeConstraints {
            $0.height.equalTo(20)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.top.equalToSuperview()
        }
        
        BackgroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.equalToSuperview()
            $0.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        sportImage.snp.makeConstraints {
            $0.height.equalTo(self.snp.height).multipliedBy(1)
            $0.right.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(0)
        }
        deleteButton.snp.makeConstraints {
            $0.height.equalTo(30)
            $0.width.equalTo(30)
            $0.top.equalToSuperview().offset(10)
            $0.right.equalToSuperview().offset(-30)
        }
        
        headLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.left.equalToSuperview().offset(40)
            $0.width.equalToSuperview().multipliedBy(0.7)
        }
        discriptionLabel.snp.makeConstraints {
            $0.top.equalTo(headLabel.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(40)
            $0.width.equalToSuperview().multipliedBy(0.55)
        }
        
        
    }
}




