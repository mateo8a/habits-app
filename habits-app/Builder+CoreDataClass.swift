//
//  Builder+CoreDataClass.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-01.
//
//

import Foundation
import CoreData

@objc(Builder)
public class Builder: NSManagedObject {
    var newSubBuilders = [SubBuilder]()
}
