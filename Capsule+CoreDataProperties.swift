//
//  Capsule+CoreDataProperties.swift
//  Time Capsule
//
//  Created by Jay Chiddarwar on 10/30/23.
//
//

import Foundation
import CoreData


extension Capsules {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Capsule> {
        return NSFetchRequest<Capsule>(entityName: "Capsules")
    }

    @NSManaged public var content: NSObject?
    @NSManaged public var id: UUID?
    @NSManaged public var isLocked: Bool
    @NSManaged public var title: String?
    @NSManaged public var unlockDate: Date?

}

extension Capsules : Identifiable {

}
