//
//  LoadingScreenViewModel.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 13.01.23.
//


import Foundation
import Combine

final class LoadingScreenViewModel {

    // MARK: - Properties
    var countryData = PassthroughSubject<CountryEntitie, Never>()
    var getIP = PassthroughSubject<String, Never>()
    private let countryService: CountryService
    private var cancellable = Set<AnyCancellable>()
    var isLoadingIndicator = PassthroughSubject<Bool, Never>()
//    var pageIndicator = PassthroughSubject<Int, Never>()

    @Published var nameFood: String = ""

    // MARK: - Init
    init(service: CountryService) {
        self.countryService = service
//        isLoadingIndicator.send(true)
    }
}

// MARK: - Public Api
extension LoadingScreenViewModel {
    
    
    func getCountry(ip:String) {
        countryService.getCountry(ip: ip)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    self.isLoadingIndicator.send(false)
                }
            }, receiveValue:{ data in
                self.countryData.send(data)
                            }).store(in: &cancellable)
                    }
        
        
    }

//    func getAllFoodMainCatalogs() {
//        productService.getProduct()
//            .receive(on: RunLoop.main)
//            .sink(receiveCompletion: { completion in
//                switch completion {
//                case .failure(let error):
//                    print(error.localizedDescription)
//                   
//                case .finished:
//                    self.isLoadingIndicator.send(false)
//                }
//            }, receiveValue: { categories in
//              
//            }).store(in: &cancellable)
//    }
    


