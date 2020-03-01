//
//  DraggableView.swift
//  15-gestos
//
//  Created by Juan Gabriel Gomila Salas on 27/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct DraggableView<T>: View where T: View {
    
    @GestureState private var dragState = DragState.none
    @State private var position = CGSize.zero
    
    var content: () -> T
    
    
    var body: some View {
        content()
        .opacity(dragState.isPressing ? 0.5 : 1.0)
        .offset(x: position.width + dragState.translation.width,
                y: position.height + dragState.translation.height)
        .animation(.easeIn)
        .gesture(
            
            LongPressGesture(minimumDuration: 1.0)
            .sequenced(before: DragGesture())
            .updating($dragState){ (value, state, transaction) in
                switch value {
                    case .first(true):
                        state = .pressing
                    case .second(true, let drag):
                        state = .dragging(translation: drag?.translation ?? .zero)
                    default:
                        break
                }
                    
                }
            .onEnded{ (value) in
                guard case .second(true, let drag?) = value else{
                    return
                }
                //S_f = S_i + T
                self.position.height += drag.translation.height
                self.position.width += drag.translation.width
            }
        )    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView(){
            Text("Me gusta aprender con Juan Gabriel")
                .font(.system(size:20, weight: .bold, design: .rounded))
                .foregroundColor(.pink)
        }
    }
}


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
    
}
