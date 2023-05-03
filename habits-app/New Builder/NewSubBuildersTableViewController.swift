//
//  NewSubBuildersController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-03.
//

import UIKit
import CoreData

class NewSubBuildersTableViewController: UITableViewController {
    
    var persistentContainer: NSPersistentContainer!
    var builder: Builder!
    var newSubBuilders = Set<SubBuilder>()
    
    override func viewDidLoad() {
        newSubBuilders = builder.subBuilders! as CFSet as! Set<SubBuilder>
        tableView.register(UINib(nibName: "NewSubBuilderCustomCell", bundle: nil), forCellReuseIdentifier: "newSubBuilderCell")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let newSubBuilders = newSubBuilders as NSSet
        builder.addToSubBuilders(newSubBuilders)
    }
    
    func addNewSubBuilderRow() {
        
        let new = SubBuilder(context: persistentContainer.viewContext)
        newSubBuilders.insert(new)
        let row = tableView.numberOfRows(inSection: 0)
        let indexPath = IndexPath(row: row, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rows: Int = newSubBuilders.count
//        if subBuilders.count > 0 {
//            rows = subBuilders.count
//        } else {
//            rows = 1
//        }
        return rows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newSubBuilderCell", for: indexPath) as! NewSubBuilderCustomCell
        
        cell.name.text = "floo"
        cell.datePicked.date = Date()
//        switch indexPath.row {
//        case 0:
//            if let subBuilders = subBuilders {
//                // populate cell with subBuilders[0]
//            }
//        default:
//            print("r")
//            // populate cell with info from subBuilders[indexPath.row]
//        }
        return cell
    }
}
