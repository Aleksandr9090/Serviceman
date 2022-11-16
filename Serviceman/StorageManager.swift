//
//  StorageManager.swift
//  Serviceman
//
//  Created by Aleksandr on 12.11.2022.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    var orders = Order.getOrders()
    
//    var ordersMap: [Int: Order] {
//        getOrdersMap(orders: orders)
//    }
    
    
    private init() {}
    
    func save(_ orders: [Order]) {
        
    }
    
    func save(_ order: Order) {
        orders.append(order)
    }
    
    func delete(_ orderIndex: Int) {
        orders.remove(at: orderIndex)
    }
    
    func edit(_ order: Order) {
        
    }
    
    func done(_ order: Order) {
        
    }
    
//    private func getOrdersMap(orders: [Order]) -> [Int : Order] {
//        var ordersMap: [Int: Order] = [:]
//        for index in 0...orders.count {
//            ordersMap[index] = orders[index]
//        }
//        return ordersMap
//    }
    
//    func getProfitForThePeriod(_ period: )
}
