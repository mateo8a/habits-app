//
//  BuilderRun+CoreDataProperties.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-01.
//
//

import Foundation
import CoreData


extension BuilderRun {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<BuilderRun> {
        return NSFetchRequest<BuilderRun>(entityName: "BuilderRun")
    }

    @NSManaged public var value: Int16
    @NSManaged public var finished: Bool
    @NSManaged public var success: Bool
    @NSManaged public var builder: Builder?

}

extension BuilderRun : Identifiable {

}
