//
//  Order.swift
//  Serviceman
//
//  Created by Aleksandr on 12.11.2022.
//

import Foundation

class Order {
    
    var phone = ""
    var address = ""
    var task = "Вскрытие и замена замка"
    var date = Date()
    var cost = 0
    var stuff = ""
    var stuffCost = 0
    var comment = "Озвученна стоимость 1000 - 1500, замена 500 - 1000"
    var owner = "Artem"
    var percentOwner = 0.5
    var isDone = false

    var profit: Int {
        Int(Double(cost - stuffCost) * (1 - percentOwner))
    }
    
    init(phone: String, address: String, task: String, date: Date,  stuff: String, stuffCost: Int, cost: Int, owner: String) {
        self.phone = phone
        self.address = address
        self.task = task
        self.date = date
        self.stuff = stuff
        self.stuffCost = stuffCost
        self.cost = cost
        self.owner = owner
    }

    static func getOrders() -> [Order] {
        var orders: [Order] = []
        
        let phones = DataManager.shared.phones
        let addresses = DataManager.shared.addresses
        let stuffs = DataManager.shared.stuffs
        let stuffsCosts = DataManager.shared.stuffsCosts
        let costs = DataManager.shared.costs
        let owners = DataManager.shared.owners
        let dates = DataManager.shared.getRandomDates()

        for index in 0..<phones.count {
            let order = Order(
                phone: phones[index],
                address: addresses[index],
                task: "Вскрытие и замена замка",
                date: dates[index],
                stuff: stuffs[index],
                stuffCost: stuffsCosts[index],
                cost: costs[index],
                owner: owners[index]
            )
            orders.append(order)
        }

        return orders
    }
    
//    static func getOrdersMap(orders: [Order]) -> [Int : Order] {
//        var ordersMap: [Int: Order] = [:]
//        for index in 0...orders.count {
//            ordersMap[index] = orders[index]
//        }
//        return ordersMap
//    }
    
}

