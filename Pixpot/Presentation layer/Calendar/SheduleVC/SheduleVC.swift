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
    private var category: GeoPlace?
    var backTapped: (() -> Void)?
    var addScheduleTapped: (() -> Void)?
    private var sportName = ["Basketball","Football","Volley"]
    private var baseCategoryImages = ["BasketballObj","FootballObj","VolleyObj"]
    private var localData: ListItem?
    
    
    init(sportStadium: SportStadium, localData: ListItem) {
        self.sportStadium = sportStadium
        self.category = localData.category
        self.localData = localData
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
    
    private var stadiumName: UILabel = {
        let label = UILabel()
        label.text = "Puskás Aréna"
        label.font = AppFont.markProFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textColor = AppColors.white
        return label
    }()
    private var stadiumAdress: UILabel = {
        let label = UILabel()
        label.text = "Budapest, Istvánmezei út 3-5, 1146, Hungary"
        label.font = AppFont.markProFont(ofSize: 14, weight: .regular)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = AppColors.white
        return label
    }()
    
    private var availableFor: UILabel = {
        let label = UILabel()
        label.text = "Available for"
        label.font = AppFont.markProFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textColor = AppColors.white
        return label
    }()
    
    private lazy var addScheduleButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Schedule", for: .normal)
        button.setTitleColor(AppColors.white, for: .normal)
        button.backgroundColor = AppColors.blue
        button.addTarget(self, action: #selector(scheduleTap), for: .touchUpInside)
         return button
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
    
    private let datePickerView: DatePickerView = {
        let view = DatePickerView()
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.isHidden = true
       
        setupUI()

        setupCollectionView()
        setupConstraints()
        
        customBar.exitTapped = {
            self.backTapped?()
        }
        
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        addScheduleButton.layer.cornerRadius = min(addScheduleButton.bounds.size.width, addScheduleButton.bounds.size.height) / 10
        addScheduleButton.clipsToBounds = true
        
        
    }
    
    private func setupUI() {
        view.backgroundColor = AppColors.darkBlue
        navigationController?.isNavigationBarHidden = true
        loadingIndicator.color = AppColors.white
    
//        loadingIndicator.startAnimating()
      
    }
    
    @objc func scheduleTap() {
        addScheduleTapped?()
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
        view.addSubview(availableFor)
        view.addSubview(headImage)
        view.addSubview(loadingIndicator)
        view.addSubview(collectionView)
        view.addSubview(stadiumName)
        view.addSubview(stadiumAdress)
        view.addSubview(addScheduleButton)
        view.addSubview(datePickerView)
        
        loadingIndicator.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
            $0.height.width.equalTo(30)
        }
        
        
        customBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        headImage.snp.makeConstraints {
            $0.top.equalTo(customBar.snp.bottom)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.9)
        }
        
        stadiumName.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(view.snp.width).multipliedBy(0.6)
            $0.height.equalTo(20)
        }
        stadiumAdress.snp.makeConstraints {
            $0.top.equalTo(stadiumName.snp.bottom)
            $0.left.equalToSuperview().offset(20)
            $0.width.equalTo(view.snp.width).multipliedBy(0.6)
            $0.height.equalTo(20)
        }
        
        availableFor.snp.makeConstraints {
            $0.top.equalTo(stadiumAdress.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(20)
        }
        
        datePickerView.snp.makeConstraints {
            $0.top.equalTo(availableFor.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalTo(addScheduleButton.snp.top).offset(-10)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(availableFor.snp.bottom).offset(5)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalTo(addScheduleButton.snp.top).offset(-10)
        }
        
        addScheduleButton.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.left.equalToSuperview().offset(40)
            $0.right.equalToSuperview().offset(-40)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
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
        switch category {
        case .baseSport:
            let headLabel = self.sportName[indexPath.row]
            let image = self.baseCategoryImages[indexPath.row]
            cell.configureCell(imageString: image , headLabel: headLabel )
        default:
            let headLabel = self.localData?.name
            let image = self.localData?.imageObjectOnly
            cell.configureCell(imageString: image ?? "", headLabel: headLabel ?? "")
        }
     
        
        
        return cell
    }
    
    
}



