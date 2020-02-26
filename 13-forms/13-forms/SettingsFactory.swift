//
//  SettingsFactory.swift
//  13-forms
//
//  Created by Juan Gabriel Gomila Salas on 25/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation
import Combine

final class SettingsFactory: ObservableObject{
    
    @Published var defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        
        defaults.register(defaults: [
            "app.view.settings.order": 0,
            "app.view.settings.showPurchasedOnly": false,
            "app.view.settings.maxPrice": 5
        ])
    }
    
    
    var order: SortingOrderType{
        get{
            SortingOrderType(type: defaults.integer(forKey: "app.view.settings.order"))
        }
        set{
            defaults.set(newValue.rawValue, forKey: "app.view.settings.order")
        }
    }
    var showPurchasedOnly: Bool{
        get{
            defaults.bool(forKey: "app.view.settings.showPurchasedOnly")
        }
        set{
            defaults.set(newValue, forKey: "app.view.settings.showPurchasedOnly")
        }
    }
    var maxPrice: Int{
        get{
            defaults.integer(forKey: "app.view.settings.maxPrice")
        }
        set{
            defaults.set(newValue, forKey: "app.view.settings.maxPrice")
        }
    }
    
}
