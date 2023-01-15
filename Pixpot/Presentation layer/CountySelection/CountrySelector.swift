//
//  LoadingScreenViewModel.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 13.01.23.
//


import Foundation
import Combine

final class CountrySelector {
    
    var appWay: ((LaunchInstructor,String) -> Void)?

    // MARK: - Properties
    private let countryData = PassthroughSubject<CountryEntitie, Never>()
    private let getLink = PassthroughSubject<String, Never>()
    private let countryService: CountryServiceProtocol
    private let helperService: HelperServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    
 

    // MARK: - Init
    init(
        service: CountryServiceProtocol,
        helperService: HelperServiceProtocol
    ) {
        self.countryService = service
        self.helperService = helperService
        
        getCountry()
        sinkData()
    }
    
    func sinkData() {
        countryData
            .sink { [weak self] data in
                guard let self = self else {return}
                if data.data.tabs == "1" {
                    self.appWay?(.app, "")
                } else {
                    self.linkRequest()
                }
            }
            .store(in: &cancellable)
        
        getLink
            .sink { [weak self] link in
                guard let self = self else {return}
                self.appWay?(.webView, link)
            }
            .store(in: &cancellable)
    }
    
    
}

// MARK: - Public Api
extension CountrySelector {
    
    
    func getCountry() {
        countryService.getCountry { [weak self] result in
            switch result {
            case .success(let country):
                self?.countryData.send(country)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func linkRequest() {
        helperService.getBroswerLink { [weak self] result in
            switch result {
            case .success(let link):
                self?.getLink.send(link.link)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
