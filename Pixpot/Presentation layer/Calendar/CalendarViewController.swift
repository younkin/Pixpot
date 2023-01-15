
import UIKit
import Foundation
import SnapKit
import CoreLocation

class CalendarViewController: UIViewController {
    
    private var sections = MockData.shared.pageData
    var locationService = DeviceLocationService.shared
    
    
    private let customBar: UICustomBar = {
        let bar = UICustomBar()
        bar.configure(title: "Find all sports \n near you", imageName: "PixtopLogo")
        return bar
    }()
    
    private var headLabel: UILabel = {
        let label = UILabel()
        label.text = "Budaörs, Sport u. 2-4,\n 2040 Hungary"
        label.numberOfLines = 0
        label.textColor = AppColors.white
        return label
    }()
    
    private var headImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BasketballHeader")
        return image
    }()

    private lazy var infoView: AskForPermissionView = {
        let view = AskForPermissionView()
        return view
    }()
    
    
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.backgroundColor = AppColors.darkBlue
        collectionView.contentMode = .center
        return collectionView
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.infoView.isHidden = true
        setupCollectionView()
        setupViews()
        
        view.backgroundColor = AppColors.darkBlue
        navigationController?.isNavigationBarHidden = true
        
        
        infoView.allowTap = {
            self.allowTapped()
            
        }
        
        
    }
    
    
    private func setupCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemSize = CGSize(width: (view.frame.width), height: 100)
        layout.itemSize = itemSize
        // Add your layout constraints
    }
    
    override func viewDidLayoutSubviews() {
        
        infoView.layer.cornerRadius = min(infoView.bounds.size.width, infoView.bounds.size.height) / 10
        infoView.clipsToBounds = true
        
        
        //        collectionView.layer.cornerRadius = min(collectionView.bounds.size.width, infoView.bounds.size.height) / 20
        //        collectionView.clipsToBounds = true
    }
    
    
    func allowTapped() {
        locationService.requestLocationUpdates()
    }
    
    private func setupViews() {
        // Add the buttons to the view
        view.addSubview(customBar)
        view.addSubview(headLabel)
        view.addSubview(headImage)
        
        view.addSubview(infoView)
        view.addSubview(collectionView)
        
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom).offset(20)
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
            $0.top.equalTo(customBar.snp.bottom).offset(10)
            $0.left.equalToSuperview().offset(20)
            $0.height.equalTo(50)
        }
        headImage.snp.makeConstraints {
            $0.top.equalTo(headLabel.snp.bottom).offset(10)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.9)
        }
        
        infoView.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom).offset(10)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalTo(view.snp.height).multipliedBy(0.3)
        }
        
    }
}


//MARK: UICollectionViewDataSource
extension CalendarViewController: UICollectionViewDelegate {
    
}

//MARK: UICollectionViewDataSource
extension CalendarViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sections[1].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let productTitle = "Budapest, Istvánmezei út 3-5,\n 1146, Hungary"
        let headLabel = "Puskás Aréna"
        let image = self.sections[1].items[indexPath.row].image
        cell.configureCell(imageString: image, productTitle: productTitle, headLabel: headLabel)
        
        
        return cell
    }
    
    
}

//MARK: DeviceLocationServiceDelegate

//extension CalendarViewController: DeviceLocationServiceDelegate {
//
//
//    func didChangeLocationStatus() {
//        return
//    }
//
//    func loacationDidChange(location: CLLocationCoordinate2D?) {
//        return
//    }
//}
