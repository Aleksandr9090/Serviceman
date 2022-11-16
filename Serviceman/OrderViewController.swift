//
//  OrderViewController.swift
//  Serviceman
//
//  Created by Aleksandr on 12.11.2022.
//

import UIKit

class OrderViewController: UIViewController {
    
    var order: Order!
    
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var taskTextField: UITextField!
    @IBOutlet var costTextField: UITextField!
    @IBOutlet var stuffTextField: UITextField!
    @IBOutlet var stuffCostTextField: UITextField!
    @IBOutlet var ownerTextField: UITextField!
    @IBOutlet var percentOwnerTextField: UITextField!
    @IBOutlet var commentTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextFields()
    }
    

    private func setupTextFields() {
        phoneTextField.text = order.phone
        addressTextField.text = order.address
        dateTextField.text = getDateString(from: order.date)
        taskTextField.text = order.task
        costTextField.text = String(order.cost)
        stuffTextField.text = order.stuff
        stuffCostTextField.text = String(order.stuffCost)
        ownerTextField.text = order.owner
        percentOwnerTextField.text = String(order.percentOwner)
        commentTextField.text = order.comment
    }
    
    private func getDateString(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"

        return dateFormatter.string(from: date)
    }

}
