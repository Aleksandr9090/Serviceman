//
//  Order.swift
//  Serviceman
//
//  Created by Aleksandr on 12.11.2022.
//

import Foundation
import RealmSwift

class Order: Object {
    
   @Persisted var phone = ""
   @Persisted var address = ""
   @Persisted var task = "Вскрытие и замена замка"
   @Persisted var date = Date()
   @Persisted var cost = 0
   @Persisted var stuff = ""
   @Persisted var stuffCost = 0
   @Persisted var comment = "Озвученна стоимость 1000 - 1500, замена 500 - 1000"
   @Persisted var owner = "Artem"
   @Persisted var percentOwner = 0.5
   @Persisted var isDone = false

     var profit: Int {
        Int(Double(cost - stuffCost) * (1 - percentOwner))
    }
    
    convenience init(phone: String, address: String, task: String, date: Date,  stuff: String, stuffCost: Int, cost: Int, owner: String) {
        self.init()
        self.phone = phone
        self.address = address
        self.task = task
        self.date = date
        self.stuff = stuff
        self.stuffCost = stuffCost
        self.cost = cost
        self.owner = owner
    }

    static func sortedByDate(orders: [Order]) -> [Order] {
        var orders: [Order] = orders
        orders.sort{$0.date > $1.date}
        
        return orders
    }
    
}

