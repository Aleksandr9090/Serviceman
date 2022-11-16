//
//  OrdersViewController.swift
//  Serviceman
//
//  Created by Aleksandr on 12.11.2022.
//

import UIKit

class OrdersViewController: UITableViewController {
    var orders: [Order] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        orders = StorageManager.shared.orders

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let order = orders[indexPath.row]
        content.text = order.address
        content.secondaryText = order.phone
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Table View Data Source
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let order = orders[indexPath.row]
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, _ in
            StorageManager.shared.delete(indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            
        }
        
        let doneAction = UIContextualAction(style: .normal, title: "Done") { _, _, isDone in
            StorageManager.shared.done(order)
            tableView.reloadRows(at: [indexPath], with: .automatic)
            isDone(true)
        }
        
        doneAction.backgroundColor = #colorLiteral(red: 0, green: 0.7089391947, blue: 0.3792886138, alpha: 1)
        
        
        return UISwipeActionsConfiguration(actions: [doneAction, deleteAction])
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let orderVC = segue.destination as? OrderViewController else { return }
        let order = orders[indexPath.row]
        orderVC.order = order
        
    }


    @IBAction func AddButtonPressed(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
}

extension OrdersViewController {
    private func showAlert(completion: (() -> Void)? = nil) {

        let alert = UIAlertController.createAlert(withTitle: "Add new order", andMessage: "Enter data in the fields")

        alert.action { order in
            self.saveOrder(order)
        }

        present(alert, animated: true)
    }
    
    private func saveOrder(_ order: Order) {
        let order = order
        StorageManager.shared.save(order)
        let rowIndex = IndexPath(row: orders.count - 1, section: 0)
        tableView.insertRows(at: [rowIndex], with: .automatic)
        tableView.reloadData()
    }
}
