//
//  DragState.swift
//  P1-ExpandableBottomSheet
//
//  Created by Juan Gabriel Gomila Salas on 02/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation
import CoreGraphics

enum DragState {
    case none
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize{
        switch self {
        case .none, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool{
        switch self {
        case .pressing, .dragging:
            return true
        case .none:
            return false
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        default:
            return false
        }
    }
    
}
