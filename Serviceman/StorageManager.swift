//
//  StorageManager.swift
//  Serviceman
//
//  Created by Aleksandr on 12.11.2022.
//

import Foundation
import RealmSwift

class StorageManager {
    
    static let shared = StorageManager()
    
    let realm = try! Realm()
    
    private init() {}
    
    func save(_ orders: [Order]) {
        write {
            realm.add(orders)
        }
    }
    
    func save(_ order: Order) {
        write {
            realm.add(order)
        }
    }
    
    func delete(_ order: Order) {
        write {
            realm.delete(order)
        }
    }
    
    func edit(
        order: Order,
        phone: String,
        address: String,
        task: String,
        cost: Int,
        stuff: String,
        stuffCost: Int,
        owner: String,
        percentOwner: Double,
        comment: String,
        date: Date,
        isDone: Bool
    )
    {
        write {
            order.phone = phone
            order.address = address
            order.task = task
            order.cost = cost
            order.stuff = stuff
            order.stuffCost = stuffCost
            order.owner = owner
            order.percentOwner = percentOwner
            order.comment = comment
            order.date = date
            order.isDone = isDone
        }
    }
    
    func done(_ order: Order) {
        write {
            order.isDone = true
        }
    }
    
    private func write(completion: () -> Void) {
        do {
            try realm.write {
                completion()
            }
        } catch {
            print(error)
        }
    }
    
}


