//
//  Record+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by HPDOG on 2023/5/22.
//
//

import Foundation
import CoreData


extension Record1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record1> {
        return NSFetchRequest<Record1>(entityName: "Record1")
    }

    @NSManaged public var id: NSDecimalNumber?
    @NSManaged public var name: String?
    @NSManaged public var createdate: String?

}

extension Record1 : Identifiable {

}
