
import UIKit
import Foundation
import SnapKit
import CoreLocation

class CalendarViewController: UIViewController {
 
    
    
    
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
    
    private lazy var askButton: UIButton = {
         let button = UIButton(type: .system)
         button.setTitle("Allow", for: .normal)
        button.setTitleColor(AppColors.white, for: .normal)
        button.backgroundColor = AppColors.blue
        button.titleLabel?.font = AppFont.markProFont(ofSize: 18, weight: .heavy)
        button.addTarget(self, action: #selector(allowTapped), for: .touchUpInside)
         return button
     }()
    
    private lazy var infoView: UIView = {
       let view = UIView()
        view.layer.bounds = CGRect(x: 0, y: 0, width: 3, height: 3)
        view.layer.borderColor = AppColors.green.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    private lazy var infoHeadLabel: UILabel = {
       let label = UILabel()
        label.text = "We did not have permission to check your location"
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 16, weight: .heavy)
        label.textColor = AppColors.white
        return label
    }()
    private lazy var infoLabel: UILabel = {
       let label = UILabel()
        label.text = "Please, allow us to track your location to find the most relevant sports facilities. "
        label.textColor = AppColors.white
        label.numberOfLines = 0
        label.font = AppFont.markProFont(ofSize: 12, weight: .regular)
        return label
    }()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = AppColors.darkBlue
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLayoutSubviews() {
      
        infoView.layer.cornerRadius = min(infoView.bounds.size.width, infoView.bounds.size.height) / 10
        infoView.clipsToBounds = true
        
        askButton.layer.cornerRadius = min(askButton.bounds.size.width, askButton.bounds.size.height) / 10
        askButton.clipsToBounds = true
    }
    
    @objc
    func allowTapped() {
            locationService.delegate = self
            locationService.requestLocationUpdates()
    }
    
    private func setupViews() {
        // Add the buttons to the view
        view.addSubview(customBar)
        view.addSubview(headLabel)
        view.addSubview(headImage)
        view.addSubview(askButton)
        view.addSubview(infoView)
        infoView.addSubview(infoHeadLabel)
        infoView.addSubview(infoLabel)
 
        
        infoHeadLabel.snp.makeConstraints {
            $0.top.equalTo(infoView).offset(16)
            $0.left.equalTo(infoView).offset(21)
            $0.width.equalTo(infoView).multipliedBy(0.8)
            $0.height.equalTo(50)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(infoHeadLabel.snp.bottom).offset(5)
            $0.left.equalTo(infoView).offset(21)
            $0.width.equalTo(infoView).multipliedBy(0.8)
            $0.height.equalTo(40)
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
        
        
        askButton.snp.makeConstraints {
            $0.top.equalTo(infoView.snp.bottom).offset(20)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.7)
            $0.height.equalTo(60)
        }
        
        
        infoView.snp.makeConstraints {
            $0.top.equalTo(headImage.snp.bottom).offset(10)
            $0.centerX.equalTo(view.snp.centerX)
            $0.width.equalToSuperview().multipliedBy(0.9)
            $0.height.equalTo(130)
        }
        
        
        
        
        
    }
    
    
    
}

extension CalendarViewController: DeviceLocationServiceDelegate {
    
    
    func didChangeLocationStatus() {
        return
    }
    
    func loacationDidChange(location: CLLocationCoordinate2D?) {
        return
    }
}
