//
//  Card.swift
//  P3-AppleWallet
//
//  Created by Juan Gabriel Gomila Salas on 06/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation


enum CardType: String {
    case visa
    case amex
    case master
    case chase
}

struct Card: Identifiable {
    var id = UUID()
    var clientName : String
    var number: String
    var expirationDate: String
    var type: CardType
    var image: String
}

let tempCards = [
    Card(clientName: "Juan Gabriel Gomila", number: "1212 1212 1212 1212",
         expirationDate: "01/21", type: .visa, image: "basic"),
    Card(clientName: "Ricardo Gomila", number: "3434 3434 3434 3434",
         expirationDate: "03/24", type: .master, image: "gold"),
    Card(clientName: "Margarita Santos", number: "5656 5656 5656 5656",
         expirationDate: "05/26", type: .master, image: "platinum"),
    Card(clientName: "Juan Gabriel Gomila", number: "7878 7878 7878 7878",
         expirationDate: "07/28", type: .amex, image: "standard")
]

