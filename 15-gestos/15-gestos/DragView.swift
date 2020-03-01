//
//  DragView.swift
//  15-gestos
//
//  Created by Juan Gabriel Gomila Salas on 27/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct DragView: View {


    @GestureState private var dragState = DragState.none
    //Gestos de arrastre
    @State private var position = CGSize.zero
        
    var body: some View {
        DraggableView(){
            Text("✈️")
                .font(.system(size:200))
        }
    }
}

struct DragView_Previews: PreviewProvider {
    static var previews: some View {
        DragView()
    }
}
