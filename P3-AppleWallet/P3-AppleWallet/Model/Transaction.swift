//
//  Transaction.swift
//  P3-AppleWallet
//
//  Created by Juan Gabriel Gomila Salas on 06/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation

struct Transaction: Identifiable{
    var id = UUID()
    var seller: String
    var amount: Double
    var date : String
    var icon: String = "dollarsign.circle.fill"
}

let transactions = [
    Transaction(seller: "Amazon", amount: 13.99, date: "06/03/2020"),
    Transaction(seller: "Carrefour", amount: 109.24, date: "05/03/2020", icon: "cart.fill"),
    Transaction(seller: "Apple", amount: 1227.00, date: "09/02/2020", icon: "gift.fill"),
    Transaction(seller: "HBO", amount: 7.99, date: "07/01/2020", icon: "tv.circle.fill")
]
