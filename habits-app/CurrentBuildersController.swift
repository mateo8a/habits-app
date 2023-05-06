//
//  CurrentHabitsController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-04-30.
//

import UIKit
import CoreData

class CurrentBuildersController: UITableViewController {
    
    var persistentContainer: NSPersistentContainer {
        let tabBarController = tabBarController as! MainScreenViewController
        return tabBarController.persistentContainer
    }
    
    override func viewDidLoad() {
        print(persistentContainer)
    }
}
