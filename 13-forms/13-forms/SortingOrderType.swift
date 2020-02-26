//
//  SortingOrderType.swift
//  13-forms
//
//  Created by Juan Gabriel Gomila Salas on 25/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation
enum SortingOrderType: Int, CaseIterable {
    
    case alphabetical = 0
    case featured = 1
    case purchased = 2
    
    init(type: Int) {
        switch type {
        case 0:
            self = .alphabetical
        case 1:
            self = .featured
        case 2:
            self = .purchased
        default:
            self = .alphabetical
        }
    }
    
    var description : String {
        switch self {
        case .alphabetical:
            return "Alfabéticamente"
        case .featured:
            return "Los favoritos al inicio"
        case .purchased:
            return "Los comprados al inicio"
        }
    }
    
    
    func predicateSort() -> ((Course, Course) -> Bool){
        switch self {
        case .alphabetical:
            return {$0.name < $1.name}
        case .featured:
            return {$0.featured && !$1.featured}
        case .purchased:
            return {$0.purchased && !$1.purchased}
        }
    }
    
}
