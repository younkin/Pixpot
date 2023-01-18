//
//  CoreDataProvider.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//



import Foundation
import CoreData




final class CoreDataProvider {
    
    static let instance = CoreDataProvider()
    
    private init() {}
    
    lazy var context: NSManagedObjectContext = {
        persistentContainer.viewContext
    }()
    func entityForName(entityName: String) -> NSEntityDescription {
        return NSEntityDescription.entity(forEntityName: entityName, in: context)!
    }
    
    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "PixpotCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
             
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
}

