//
//  OrderViewController.swift
//  Serviceman
//
//  Created by Aleksandr on 12.11.2022.
//

import UIKit

class OrderViewController: UIViewController {
    
    var order: Order!
    
    @IBOutlet var datePicker: UIDatePicker!
    
    @IBOutlet var doneSwitch: UISwitch!
    
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var addressTextField: UITextField!
    @IBOutlet var taskTextField: UITextField!
    @IBOutlet var costTextField: UITextField!
    @IBOutlet var stuffTextField: UITextField!
    @IBOutlet var stuffCostTextField: UITextField!
    @IBOutlet var ownerTextField: UITextField!
    @IBOutlet var percentOwnerTextField: UITextField!
    @IBOutlet var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneSwitch.isOn = order.isDone
        
        setupTextFields()
        
        datePicker.date = order.date
        datePicker.addTarget(self, action: #selector(dateChange), for: UIControl.Event.valueChanged)
    }
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        StorageManager.shared.edit(
            order: order,
            phone: phoneTextField.text ?? "",
            address: addressTextField.text ?? "",
            task: taskTextField.text ?? "",
            cost: Int(costTextField.text ?? "") ?? 0,
            stuff: stuffTextField.text ?? "",
            stuffCost: Int(stuffTextField.text ?? "") ?? 0,
            owner: ownerTextField.text ?? "",
            percentOwner: Double(percentOwnerTextField.text ?? "") ?? 0.5,
            comment: commentTextField.text ?? "",
            date: datePicker.date,
            isDone: doneSwitch.isOn
        )
        navigationController?.popViewController(animated: true)
    }
    
    @objc private func dateChange(datePicker: UIDatePicker) {
        
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
