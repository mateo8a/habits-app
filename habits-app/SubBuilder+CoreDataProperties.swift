//
//  SubBuilder+CoreDataProperties.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-01.
//
//

import Foundation
import CoreData


extension SubBuilder {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SubBuilder> {
        return NSFetchRequest<SubBuilder>(entityName: "SubBuilder")
    }

    @NSManaged public var value: Int16
    @NSManaged public var finished: Bool
    @NSManaged public var success: Bool
    @NSManaged public var builder: Builder?

}

extension SubBuilder : Identifiable {

}
