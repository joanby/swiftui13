//
//  ContentView.swift
//  15-gestos
//
//  Created by Juan Gabriel Gomila Salas on 27/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var hasBeenPressed = false
    
    @GestureState private var hasBeenLongPressed = false
    
    var body: some View {
        Image(systemName: "paperclip.circle.fill")
            .font(.system(size:150))
            .foregroundColor(.purple)
            .opacity(hasBeenLongPressed ? 0.5 : 1.0)
            .scaleEffect(hasBeenPressed ? 2.0 : 1.0)
            .animation(.easeIn)
            .gesture(
                LongPressGesture(minimumDuration: 2.0)
                    .updating($hasBeenLongPressed){ (value, state, transaction) in
                        state = value
                    }
                    .onEnded{ _ in
                        self.hasBeenPressed.toggle()
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
