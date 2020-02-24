//
//  Course.swift
//  12-modals
//
//  Created by Juan Gabriel Gomila Salas on 24/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation

struct Course: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var feature: Bool = false
    var description: String = ""
}
