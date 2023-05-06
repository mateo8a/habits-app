//
//  FinalNewBuilderController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-06.
//

import UIKit
import CoreData

class FinalNewBuilderController: UIViewController {
    
    var persistentContainer: NSPersistentContainer!
    var builder: Builder!
    
    @IBOutlet var finishButton: UIButton!
    
    override func viewDidLoad() {
        finishButton.addTarget(self, action: #selector(finishBuilderCreation(sender:)), for: .touchUpInside)
    }
    
    @objc func finishBuilderCreation(sender: UIButton) {
        performSegue(withIdentifier: "FinishSetupNewBuilder", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "FinishSetupNewBuilder":
            print("Finish setup")
        default:
            preconditionFailure("Unknown segue identifier")
        }
    }
}
