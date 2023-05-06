//
//  ViewController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-04-30.
//

import UIKit
import CoreData

class MainScreenViewController: UITabBarController {
    
    let persistentContainer = {
        let container = NSPersistentContainer(name: "habits_app")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error setting up Core Data (\(error)).")
            }
        }
        return container
    }()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "newBuilder":
            let newBuilderController = segue.destination as! InitialNewBuilderController
            newBuilderController.persistentContainer = persistentContainer
        default:
            print("Unknown segue identifier")
        }
    }
    
    @IBAction func unwindFromBuilderCreation(_ segue: UIStoryboardSegue) {

    }
}

