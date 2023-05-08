//
//  SubBuilder+CoreDataProperties.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-08.
//
//

import Foundation
import CoreData


extension SubBuilder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubBuilder> {
        return NSFetchRequest<SubBuilder>(entityName: "SubBuilder")
    }

    @NSManaged public var cashValue: Int16
    @NSManaged public var dayToBeDone: Date?
    @NSManaged public var finished: Bool
    @NSManaged public var placeInDailyQueue: Int16
    @NSManaged public var success: Bool
    @NSManaged public var builder: Builder?

}

extension SubBuilder : Identifiable {

}
