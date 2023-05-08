//
//  newSubBuilderCell.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-03.
//

import UIKit

class NewSubBuilderCustomCell: UITableViewCell {
    @IBOutlet weak var calendarSwitch: UISwitch!
    @IBOutlet weak var valueField: UITextField!
    @IBOutlet weak var datePicked: UIDatePicker!
    
    @IBAction func switchCalendarMode(_ sender: UISwitch) {
        if sender.isOn {
            datePicked.datePickerMode = .date
        } else {
            datePicked.datePickerMode = .dateAndTime
        }
    }
}
