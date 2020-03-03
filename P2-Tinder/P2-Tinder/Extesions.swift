//
//  Extesions.swift
//  P2-Tinder
//
//  Created by Juan Gabriel Gomila Salas on 03/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation
import SwiftUI

extension AnyTransition{
    
    static var trailingBottomAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .trailing)
                                    .combined(with: .move(edge: .bottom)))
    }
    
    
    static var leadingBottomAtRemoval: AnyTransition{
        AnyTransition.asymmetric(insertion: .identity,
                                 removal: AnyTransition
                                    .move(edge: .leading)
                                    .combined(with: .move(edge: .bottom)))
    }
    
    //TODO: definir leadingTop at removal / trailingTop at removal
}
