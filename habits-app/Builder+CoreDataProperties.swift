//
//  Builder+CoreDataProperties.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-01.
//
//

import Foundation
import CoreData


extension Builder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Builder> {
        return NSFetchRequest<Builder>(entityName: "Builder")
    }

    @NSManaged public var startDate: Date?
    @NSManaged public var endDate: Date?
    @NSManaged public var finished: Bool
    @NSManaged public var name: String?
    @NSManaged public var totalValue: Int16
    @NSManaged public var success: Bool
    @NSManaged public var valueEarned: Int16
    @NSManaged public var allOrNothing: Bool
    @NSManaged public var builderRuns: NSSet?

}

// MARK: Generated accessors for builderRuns
extension Builder {

    @objc(addBuilderRunsObject:)
    @NSManaged public func addToBuilderRuns(_ value: BuilderRun)

    @objc(removeBuilderRunsObject:)
    @NSManaged public func removeFromBuilderRuns(_ value: BuilderRun)

    @objc(addBuilderRuns:)
    @NSManaged public func addToBuilderRuns(_ values: NSSet)

    @objc(removeBuilderRuns:)
    @NSManaged public func removeFromBuilderRuns(_ values: NSSet)

}

extension Builder : Identifiable {

}
