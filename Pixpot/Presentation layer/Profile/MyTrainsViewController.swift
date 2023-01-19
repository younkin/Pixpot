//
//  MyTrainsViewController.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//



import UIKit
import SnapKit
import WebKit

class MyTrainsViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    private let sheduleManager: SheduleManagerProtocol = SheduleManager()
    
    
    var exitTapped: (() -> Void)?
    
    private var savedShedules: [Shedule] = []
    let loadingIndicator = UIActivityIndicatorView(style: .medium)
    
    private let customBar: UICustomBar = {
        let bar = UICustomBar(withBackButton: true)
        bar.configure(title: "Find all sports \n near you", imageName: "PixtopLogo")
        return bar
    }()
    private let savedIsEmptyView: SavedIsEmptyView = {
        let view = SavedIsEmptyView()
        return view
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TrainCell.self, forCellWithReuseIdentifier: "TrainCell")
        collectionView.backgroundColor = AppColors.darkBlue
        collectionView.contentMode = .center
        return collectionView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        savedIsEmptyView.isHidden = true
        collectionView.isHidden = true
        loadingIndicator.startAnimating()
        
        sheduleManager.getAllShedules { result in
            switch result {
            case.success(let shedules):
                self.savedShedules = shedules
                if shedules.isEmpty {
                    self.savedIsEmptyView.isHidden = false
                    self.collectionView.isHidden = true
                } else {
                    self.savedIsEmptyView.isHidden = true
                    self.collectionView.isHidden = false
                }
                self.collectionView.reloadData()
                self.loadingIndicator.stopAnimating()
            case.failure(let fail):
                break
            }
            
        }
        
        
        
        
        if savedShedules.isEmpty {
            
            
        }
        
        setupCollectionView()
        setupViews()
        view.backgroundColor = AppColors.darkBlue
        
        navigationController?.isNavigationBarHidden = true
        
        
        customBar.exitTapped = {
            self.exitTapped?()
        }
        
        
        
    }
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemSize = CGSize(width: (view.frame.width), height: 120)
        layout.itemSize = itemSize
        
        // Add your layout constraints
    }
    
  
    
    private func setupViews() {
        // Add the buttons to the view
        view.addSubview(customBar)
        view.addSubview(collectionView)
        view.addSubview(savedIsEmptyView)
        view.addSubview(loadingIndicator)
        
        customBar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(customBar.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-100)
        }
        savedIsEmptyView.snp.makeConstraints {
            $0.top.equalTo(customBar.snp.bottom).offset(20)
            $0.left.equalToSuperview().offset(20)
            $0.right.equalToSuperview().offset(-20)
            $0.height.equalTo(130)
        }
        loadingIndicator.snp.makeConstraints {
            $0.center.equalTo(view.snp.center)
        }
        
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return savedShedules.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TrainCell", for: indexPath) as! TrainCell

        let adress = savedShedules[indexPath.row].adress
        let headLabel = savedShedules[indexPath.row].name
        let image = savedShedules[indexPath.row].image
        guard let date = savedShedules[indexPath.row].date else {return cell}
        
        cell.configureCell(imageString: image ?? "", productTitle: adress ?? "", headLabel: headLabel ?? "", date: date, indexPath: indexPath)
        
        cell.cancellable = cell.tapDeleteBtn.sink { [weak self] indexPath in
//            self?.deleteProduct?(index!)
            print("index from vc \(indexPath)")
        }
        
        return cell
    }
}


//      let dateComponents = DateComponents(year: 2022, month: 1, day: 1, hour: 10, minute: 0, second: 0)
//      let userCalendar = Calendar.current
//      guard let date = userCalendar.date(from: dateComponents) else {
//          print("Invalid date components")
//          return
//      }
//      sheduleManager.addNewShedule(name: "333", image: "RunningObj", adress: "333", date: date) { result in
//          switch result {
//          case.success(let result):
//              print(result)
//              print("added")
//              break
//          case .failure(let error):
//              print(error)
//              break
//          }
//      }
//
//      sheduleManager.getAllShedules { result in
//          switch result {
//          case.success(let result):
//              print(result)
//              for i in result {
//                  print(i.name)
//              }
//              print("printed")
//              break
//          case .failure(let error):
//              print(error)
//              break
//          }
//      }
