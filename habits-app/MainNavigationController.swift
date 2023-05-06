//
//  MainNavigationController.swift
//  habits-app
//
//  Created by Mateo Ochoa on 2023-05-06.
//

import UIKit

class MainNavigationController: UINavigationController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "newSegue":
            print("seguee")
        default:
            preconditionFailure("Unknown segue identifier")
        }
    }
}
