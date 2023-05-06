//
//  NewSubBuildersController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-02.
//

import UIKit
import CoreData

class SetupSubBuildersController: UIViewController {
    
    var persistentContainer: NSPersistentContainer!
    var builder: Builder!
    var subBuildersController: NewSubBuildersTableViewController!
    
    override func viewDidLoad() {
        navigationItem.title = builder.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "newSubBuildersList":
            let destination = segue.destination as! NewSubBuildersTableViewController
            destination.persistentContainer = persistentContainer
            destination.builder = builder
            subBuildersController = destination
        case "AllOrNothingSetup":
            let destination = segue.destination as! FinalNewBuilderController
            destination.persistentContainer = persistentContainer
            destination.builder = builder
        default:
            preconditionFailure("Unknown segue identifier")
        }
    }
    
    @IBAction func addSubBuilder(_ sender: UIButton) {
        subBuildersController.addNewSubBuilderRow()
    }
    
    @IBAction func continueSetup(_ sender: UIButton) {
        
    }
}
