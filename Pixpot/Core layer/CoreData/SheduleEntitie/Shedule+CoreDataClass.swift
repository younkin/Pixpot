//
//  Shedule+CoreDataClass.swift
//  Pixpot
//
//  Created by Евгений Юнкин on 18.01.23.
//
//

import Foundation
import CoreData

@objc(Shedule)
public class Shedule: NSManagedObject {
    convenience init() {
        self.init(entity: CoreDataProvider.instance.entityForName(entityName: "Shedule"), insertInto: CoreDataProvider.instance.context)
    }
}
