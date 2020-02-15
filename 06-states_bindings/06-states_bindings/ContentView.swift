//
//  ContentView.swift
//  06-states_bindings
//
//  Created by Juan Gabriel Gomila Salas on 15/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPlaying = false
    
    var body: some View {
        Button(action: {
            self.isPlaying.toggle()
        }){
            Image(systemName:isPlaying ? "stop.circle.fill" : "play.circle.fill")
                .font(.system(size:100))
                .foregroundColor(isPlaying ? .red : .blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
