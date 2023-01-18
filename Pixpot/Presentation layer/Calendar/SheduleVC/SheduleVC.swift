//
//  SheduleVC.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//


import UIKit
import Foundation
import SnapKit
import Combine

class SheduleVC: UIViewController {
    




    
    let loadingIndicator = UIActivityIndicatorView(style: .medium)
    private var bag = Set<AnyCancellable>()
    private var sportStadium: SportStadium?
    private var imageObjc: String?
    private var imageHead: String?
    private var category: GeoPlace?
    var backTapped: (() -> Void)?
    
    init(sportStadium: SportStadium, localData: ListItem) {
        self.imageHead = localData.imageBig
        self.imageObjc = localData.imageObjectOnly
        self.sportStadium = sportStadium
        self.category = localData.category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let customBar: UICustomBar = {
        let bar = UICustomBar(withBackButton: true)
        bar.configure(title: "Find all sports \n near you", imageName: "PixtopLogo")
        return bar
    }()
    
    private var headImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sheaduleHeadImage")
        return image
    }()
    
    
    var headLabel: UILabel = {
        let label = UILabel()
        label.text = "Budaörs, Sport u. 2-4,\n 2040 Hungary"
        label.numberOfLines = 0
        label.textColor = AppColors.white
        return label
    }()
    
    
   
    
//    private lazy var itemNotFoundView: ItemNotFoundView = {
//        let view = ItemNotFoundView()
//        return view
//    }()
    
    
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(sheduleCustomCell.self, forCellWithReuseIdentifier: "sheduleCustomCell")
        collectionView.backgroundColor = AppColors.darkBlue
        collectionView.contentMode = .center
        return collectionView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setupUI()

        setupCollectionView()
        setupConstraints()
        
        customBar.exitTapped = {
            self.backTapped?()
        }
        
       
    }
    
   
    
    private func setupUI() {
        view.backgroundColor = AppColors.darkBlue
        navigationController?.isNavigationBarHidden = true
        loadingIndicator.color = AppColors.white
    
//        loadingIndicator.startAnimating()
      
    }
    
   
   
   
    
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemSize = CGSize(width: (view.frame.width / 2.5), height: 100)
        layout.itemSize = itemSize
        // Add your layout constraints
    }
    
    
    
  
    
    private func setupConstraints() {
        // Add the buttons to the view
        view.addSubview(customBar)
        view.addSubview(headLabel)
        view.addSubview(headImage)
        view.addSubview(loadingIndicator)
        view.addSubview(collectionView)
        
        loadingIndicator.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
            $0.height.width.equalTo(30)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headLabel.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-100)
        }
        
        customBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(70)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(60)
        }
        
        headLabel.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(50)
        }
        headImage.snp.makeConstraints {
            $0.top.equalTo(customBar.snp.bottom)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.9)
        }
    
        
    }
}


//MARK: UICollectionViewDataSource
extension SheduleVC: UICollectionViewDelegate {
    
}

//MARK: UICollectionViewDataSource
extension SheduleVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch category {
        case .baseSport:
            return 3
        default:
            return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sheduleCustomCell", for: indexPath) as! sheduleCustomCell
        
        let productTitle = sportStadium?.address_line2
        let headLabel = sportStadium?.name
        let image = self.imageObjc
        cell.configureCell(imageString: image ?? "", headLabel: headLabel ?? "")
        
        
        return cell
    }
    
    
}



