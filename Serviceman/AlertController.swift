//
//  AlertController.swift
//  Serviceman
//
//  Created by Aleksandr on 14.11.2022.
//

import UIKit

extension UIAlertController {
    
    static func createAlert(withTitle title: String, andMessage message: String) -> UIAlertController {
        UIAlertController(title: title, message: message, preferredStyle: .alert)
    }
    
    func action(completion: @escaping (Order) -> Void) {
                                
        let saveAction = UIAlertAction(title: "Save", style: .default) { [self] _ in
            let order = Order(
                phone: textFields?[0].text ?? "",
                address: textFields?[1].text ?? "",
                task: textFields?[2].text ?? "",
                date: Date(),
                stuff: textFields?[3].text ?? "",
                stuffCost: Int(textFields?[4].text ?? "") ?? 0,
                cost: Int(textFields?[5].text ?? "") ?? 0,
                owner: textFields?[6].text ?? ""
            )
            completion(order)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive)
        
        addAction(saveAction)
        addAction(cancelAction)
        
        addTextField { textField in
            textField.placeholder = "Phone"
        }
        addTextField { textField in
            textField.placeholder = "Address"
        }
        addTextField { textField in
            textField.placeholder = "Task"
        }
        addTextField { textField in
            textField.placeholder = "Cost"
        }
        addTextField { textField in
            textField.placeholder = "Stuff"
        }
        addTextField { textField in
            textField.placeholder = "StuffCost"
        }
        addTextField { textField in
            textField.placeholder = "Comment"
        }
        addTextField { textField in
            textField.placeholder = "Owner"
        }
        addTextField { textField in
            textField.placeholder = "PercentOwner"
        }

    }
}
