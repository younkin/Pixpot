//
//  Shedule+CoreDataProperties.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//
//

import Foundation
import CoreData


extension Shedule {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Shedule> {
        return NSFetchRequest<Shedule>(entityName: "Shedule")
    }

    @NSManaged public var name: String?
    @NSManaged public var adress: String?
    @NSManaged public var date: Date?
    @NSManaged public var image: String?

}

extension Shedule : Identifiable {

}
