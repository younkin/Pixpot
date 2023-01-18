//
//  SheduleManager.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//



import UIKit
import CoreData
import Network


protocol SheduleManagerProtocol {
    func addNewShedule(name: String, image: String,adress: String, date: Date, complition: @escaping (Result<Void, AuthError>) -> Void)
    func getAllShedules(complition: @escaping (Result<[Shedule], AuthError>) -> Void)
}

enum AuthError: Error {
    case duplicate
    case userNotExist
    case wrongPassword
    case loginFailed
    case unknown
    case networkError
}

final class SheduleManager: SheduleManagerProtocol {
    
    private let monitor = NWPathMonitor()
    private var isConnectioned: Bool = false
    
    struct Constants {
        static let entity = "Shedule"
    }
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            if path.status == .satisfied {
                self?.isConnectioned = true
            } else {
                self?.isConnectioned = false
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addNewShedule(name: String, image: String,adress: String, date: Date, complition: @escaping (Result<Void, AuthError>) -> Void) {
        if checkNameInBase(name:name) {
                complition(.failure(.duplicate))
            return
        }
        // TODO: !!!
        let object = Shedule()
        object.name = name
        object.adress = adress
        object.date = date
        object.image = image
        
        CoreDataProvider.instance.saveContext()
        //        let token = UUID().uuidString
//        let token = "2ed332edfrssr"
            complition(.success(()))
        

    }
    
    
    func getAllShedules(complition: @escaping (Result<[Shedule], AuthError>) -> Void) {
        
       
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entity)

        do {
            let result = try CoreDataProvider.instance.context.fetch(fetchRequest) as! [Shedule]
            complition(.success(result))
            print(result)
            
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        
    }
    
    
    
//
//
//    func changePassword(mail: String, password: String, newPassword: String, complition: @escaping (Result<Void, AuthError>) -> Void)
//    {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entity)
//        let predicate = NSPredicate(format: "mail = %@", mail)
//        fetchRequest.predicate = predicate
//        do {
//            let results = try CoreDataProvider.instance.context.fetch(fetchRequest)
//            guard let person = results.first as? Shedule else {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    complition(.failure(.userNotExist))
//                }
//                return
//            }
//            guard person.password == password else {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//
//                    complition(.failure(.wrongPassword))
//                }
//                return
//            }
//            person.password = newPassword
//            CoreDataProvider.instance.saveContext()
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                complition(.success(()))
//            }
//            return
//        } catch {
//            print(error)
//        }
//        // TODO: !!!
////        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////            complition(Response(result: .connectionFail))
////        }
//    }
//
    private func checkNameInBase(name: String) -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entity)
        let predicate = NSPredicate(format: "name = %@", name)
        fetchRequest.predicate = predicate
        do {
            let count = try CoreDataProvider.instance.context.count(for: fetchRequest)
            if count > 0 {
                return true
            }
        } catch {
            print(error)
        }
        return false
    }
//
//    func authorize(mail: String, password: String, complition: @escaping (Result<Void, AuthError>) -> Void) {
//        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constants.entity)
//        let predicate = NSPredicate(format: "mail == %@ AND password == %@", mail, password)
//        fetchRequest.predicate = predicate
//        do {
//            let count = try CoreDataProvider.instance.context.count(for: fetchRequest)
//            if count > 0 {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    complition(.success(()))
//                }
//            } else {
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    complition(.failure(.loginFailed))
//                }
//            }
//        } catch {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                complition(.failure(.unknown))
//            }
//        }
//    }
    
}





