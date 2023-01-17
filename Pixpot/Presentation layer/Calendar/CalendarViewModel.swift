//
//  CalendarViewModel.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 16.01.23.
//

import Foundation
import Combine


protocol CalendarViewModelProtocol {
    
    func getSelectedCategory()
    func getStadiums(lat: Double,long: Double,radius: Int, filter: GeoPlace)
    func getCoordinates(completion: @escaping (Result<ActualCoordinates, Errors>) -> Void)
    
    
    var stadiumsPublisher: PassthroughSubject<[SportStadium], Never> {get set}
    var selectedCategoryPublisher: PassthroughSubject<ListItem, Never> {get set}
}



struct ActualCoordinates {
    var lat: Double?
    var long: Double?
}

enum Errors: Error {
    case unknown
}


final class CalendarViewModel: CalendarViewModelProtocol {
    
    
  
    

    private let container: DIContainer
    private let locationService: IDeviceLocationService & DeviceLocationServiceOutput = DeviceLocationService.shared
    private var bag = Set<AnyCancellable>()
    var stadiumsPublisher = PassthroughSubject<[SportStadium], Never>()
    var selectedCategoryPublisher = PassthroughSubject<ListItem, Never>()
    private var localData = MockData.shared
    
    
    init(container: DIContainer) {
        self.container = container
    }
    
    
    func getSelectedCategory() {
        let index = localData.selectedIndex
        let list = localData.pageData[index?.row ?? 0].items.first
        guard let listItem = list else {return}
        selectedCategoryPublisher.send(listItem)
        
    }
    
    func getCoordinates(completion: @escaping (Result<ActualCoordinates, Errors>) -> Void) {
        var actualCoordinates = ActualCoordinates(lat: nil, long: nil)
        locationService.locationPublisher.sink { coordinates in
           
            guard let coord = coordinates else { return completion(.failure(.unknown)) }
            actualCoordinates.lat = coord.latitude
            actualCoordinates.long = coord.longitude
            return completion(.success(actualCoordinates))
        }.store(in: &bag)
        
        
    }
    
  

    
    func getStadiums(lat: Double,long: Double,radius: Int, filter: GeoPlace) {
        container.geoService.getSportStadiums(
            place: filter,
            filter: .circle(lat: lat, long: long, radius: radius)

        ) { [weak self] result in
            switch result {
            case .success(let stadiums):
                self?.stadiumsPublisher.send(stadiums)
//                debugPrint(stadiums)
            case .failure(let error):
                
                print(error.localizedDescription)
            }
        }
        
    }
    
    
}





