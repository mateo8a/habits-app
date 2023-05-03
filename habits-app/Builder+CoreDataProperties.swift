//
//  Builder+CoreDataProperties.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-02.
//
//

import Foundation
import CoreData


extension Builder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Builder> {
        return NSFetchRequest<Builder>(entityName: "Builder")
    }

    @NSManaged public var allOrNothing: Bool
    @NSManaged public var endDate: Date?
    @NSManaged public var finished: Bool
    @NSManaged public var name: String?
    @NSManaged public var startDate: Date?
    @NSManaged public var success: Bool
    @NSManaged public var totalCashValue: Int16
    @NSManaged public var subBuilders: NSSet?

}

// MARK: Generated accessors for subBuilders
extension Builder {

    @objc(addSubBuildersObject:)
    @NSManaged public func addToSubBuilders(_ value: SubBuilder)

    @objc(removeSubBuildersObject:)
    @NSManaged public func removeFromSubBuilders(_ value: SubBuilder)

    @objc(addSubBuilders:)
    @NSManaged public func addToSubBuilders(_ values: NSSet)

    @objc(removeSubBuilders:)
    @NSManaged public func removeFromSubBuilders(_ values: NSSet)

}

extension Builder : Identifiable {

}
