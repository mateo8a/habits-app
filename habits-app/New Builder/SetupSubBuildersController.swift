//
//  NewSubBuildersController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-02.
//

import UIKit
import CoreData

class SetupSubBuildersController: UIViewController {
    
    @IBOutlet var fillValues: UIButton!
    @IBOutlet var continueSetup: UIButton!
    var persistentContainer: NSPersistentContainer!
    var builder: Builder!
    var subBuildersController: NewSubBuildersTableViewController!
    
    override func viewDidLoad() {
        navigationItem.title = builder.name
        continueSetup.addTarget(self, action: #selector(continueSetup(_:)), for: .touchUpInside)
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)

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
            preconditionFailure("Unknown segue identifier: \(String(describing: segue.identifier))")
        }
    }
    
    @objc func continueSetup(_ sender: UIButton) {
        do {
            try subBuildersController.validateSubBuilders()
            print("segueing")
            performSegue(withIdentifier: "AllOrNothingSetup", sender: sender)
        } catch NewSubBuilderError.NoCashValue {
            print("Error is ")
        } catch NewSubBuilderError.TotalValueError {
            print("Error is ")
        } catch {
            preconditionFailure("Unknown error \(error)")
        }
    }
    
    @IBAction func addSubBuilder(_ sender: UIButton) {
        subBuildersController.addNewSubBuilderRow()
    }

}

enum NewSubBuilderError: Error {
    case NoCashValue
    case TotalValueError
}
