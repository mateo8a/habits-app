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
    
    override func viewDidLoad() {
        tableView.register(UINib(nibName: "NewSubBuilderCustomCell", bundle: nil), forCellReuseIdentifier: "newSubBuilderCell")
        tableView.allowsSelection = true
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        for (index, subBuilder) in builder.newSubBuilders.enumerated() {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! NewSubBuilderCustomCell
            subBuilder.builder = builder
            subBuilder.cashValue = NumberFormatter().number(from: cell.valueField.text!)! as! Int16
            subBuilder.dayToBeDone = cell.datePicked.date
        }
    }
    
    func addNewSubBuilderRow() {
        let row = builder.newSubBuilders.count
        let newSubBulder = SubBuilder(context: persistentContainer.viewContext)
        newSubBulder.cashValue = 10
        builder.newSubBuilders.append(newSubBulder)
        let indexPath = IndexPath(row: row, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func validateSubBuilders() throws {
        var totalValue: Int16 = 0
        for (index, _) in builder.newSubBuilders.enumerated() {
            let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as! NewSubBuilderCustomCell
            let cashValue = NumberFormatter().number(from: cell.valueField.text!)! as! Int16
            if (cashValue) <= 0 {
                throw NewSubBuilderError.NoCashValue
            }
            totalValue += cashValue
        }
        if totalValue != builder.totalCashValue {
            throw NewSubBuilderError.TotalValueError
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return builder.newSubBuilders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "newSubBuilderCell", for: indexPath) as! NewSubBuilderCustomCell
        let subBuilder = builder.newSubBuilders[indexPath.row]
        cell.datePicked.date = subBuilder.dayToBeDone ?? Date()
        cell.valueField.text = subBuilder.cashValue.description
        
        return cell
    }
}
