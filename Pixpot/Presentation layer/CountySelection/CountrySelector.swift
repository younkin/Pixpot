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
    var countryData = PassthroughSubject<CountryEntitie, Never>()
    var getLink = PassthroughSubject<String, Never>()
    private let countryService: CountryService
    private var cancellable = Set<AnyCancellable>()
    


 

    // MARK: - Init
    init(service: CountryService) {
        self.countryService = service
       
        getCountry()
        sinkData()
       
        
    }
    
    func sinkData() {
        countryData.sink {[weak self] data in
            guard let self = self else {return}
            if data.data.tabs == "1" {
                self.appWay?(.app, "")
            } else {
                self.linkRequest()
            }
        }.store(in: &cancellable)
        
        getLink.sink {[weak self] link in
            guard let self = self else {return}
            self.appWay?(.webView, link)
        }.store(in: &cancellable)
    }
    
    
}

// MARK: - Public Api
extension CountrySelector {
    
    
    func getCountry() {
        
        countryService.getCountry()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue:{ data in
                self.countryData.send(data)
            }).store(in: &cancellable)
        
        
        countryService.getSportStadiums(long: "-122.406417", lat: "37.785834")
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error.localizedDescription)
                case .finished:
                    break
                }
            }, receiveValue:{ data in
                print(data.features.first?.properties.name)
                print("тут")
            }).store(in: &cancellable)
    

    }
    
    func linkRequest() {
        let url = URL(string: "https://pixpot.host/user/auth.json")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            do {
                let links = try JSONDecoder().decode([Link].self, from: data)
                for link in links {
                    self.getLink.send(link.link)
                }
            } catch {
                print(error)
            }
        }
        task.resume()
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
    


