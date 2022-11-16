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
    @IBOutlet var datePicker: UIDatePicker!
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
        
        datePicker.addTarget(self, action: #selector(dateChange), for: UIControl.Event.valueChanged)
    }
    
    @objc private func dateChange() {
        
    }
    
    private func setupTextFields() {
        phoneTextField.text = order.phone
        addressTextField.text = order.address
        taskTextField.text = order.task
        costTextField.text = String(order.cost)
        stuffTextField.text = order.stuff
        stuffCostTextField.text = String(order.stuffCost)
        ownerTextField.text = order.owner
        percentOwnerTextField.text = String(order.percentOwner)
        commentTextField.text = order.comment
    }
    
    private func getFormatDate(_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"

        return dateFormatter.string(from: date)
    }

}
