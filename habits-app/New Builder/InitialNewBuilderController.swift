//
//  NewBuilderController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-02.
//

import UIKit
import CoreData

class InitialNewBuilderController: UIViewController {
    
    @IBOutlet var name: UITextField!
    @IBOutlet var totalCashValue: UITextField!
    @IBOutlet var saveForLater: UIButton!
    @IBOutlet var startNow: UIButton!
    
    var persistentContainer: NSPersistentContainer!
    var builder: Builder!
    
    override func viewDidLoad() {
        saveForLater.addTarget(self, action: #selector(addNewBuilder(sender:)), for: .touchUpInside)
        startNow.addTarget(self, action: #selector(addNewBuilder(sender:)), for: .touchUpInside)
        
    }
    
    @objc func addNewBuilder(sender: UIButton) {
        print("save name and total cash value")
        let context = persistentContainer.viewContext
        context.performAndWait {
            builder = Builder(context: context)
            setUpNewBuilder(builder)
        }
//        do {
//            try context.save()
//        } catch {
//            print("Error saving new builder \(error)")
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "setupSubBuilders":
            let controller = segue.destination as! SetupSubBuildersController
            controller.builder = builder
            controller.persistentContainer = persistentContainer
        default:
            print("Unknown segue identifier")
        }
    }
    
    func setUpNewBuilder(_ builder: Builder) {
        builder.name = name.text
        builder.totalCashValue = numberFormatter.number(from: totalCashValue.text!) as! Int16
//        builder.allOrNothing = allOrNothing.selectedSegmentIndex == 0
//        if startNow.selectedSegmentIndex == 0 {
//            builder.startDate = Date()
//        }
//        let iterations = numberFormatter.number(from: numberOfIterations.text!) as! Int
    }
    
    // MARK: Private methods
    
    private let numberFormatter = NumberFormatter()
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
       return formatter
    }()
}
