
import UIKit
import Foundation
import SnapKit
import CoreLocation
import Combine

class CalendarViewController: UIViewController {
    
    private var sections = MockData.shared.pageData
    var locationService = DeviceLocationService.shared
    var calendarViewModel: CalendarViewModelProtocol
    private var sportStadiums: [SportStadium] = []
    private var sportCategory: GeoPlace = .baseSport
    
    private var bag = Set<AnyCancellable>()
//    private let countryData = PassthroughSubject<CountryEntitie, Never>()
    
    init(viewModel: CalendarViewModelProtocol) {
        self.calendarViewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
        image.image = UIImage(named: "BasketBallBig")
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
        

        calendarViewModel.stadiumsPublisher.sink(receiveValue: { stadiums in
            self.sportStadiums = stadiums
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
//            print(stadiums)
        }).store(in: &bag)
        
        
        
        
        view.backgroundColor = AppColors.darkBlue
        navigationController?.isNavigationBarHidden = true
        self.infoView.isHidden = true
        self.collectionView.isHidden = true
        setupCollectionView()
        setupViews()
        getCoordinates()
        
        
        infoView.allowTap = {
            self.allowTapped()
            
        }
    }
    
    
    func getCoordinates() {
        calendarViewModel.getCoordinates { result in
            switch result {
            case .success(let coord):
                print(coord)
                self.calendarViewModel.getStadiums(lat: 37.785834, long: -122.406417, radius: 5000, filter: self.sportCategory)
                self.collectionView.isHidden = false
            case .failure(_):
                self.infoView.isHidden = false
                break
            }
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
        self.infoView.isHidden = true
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
        
        return sportStadiums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let productTitle = sportStadiums[indexPath.row].address_line2
        let headLabel = sportStadiums[indexPath.row].name
        let image = self.sections[0].items[1].imageObjectOnly
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
