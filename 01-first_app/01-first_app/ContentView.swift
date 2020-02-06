//
//  ContentView.swift
//  01-first_app
//
//  Created by Juan Gabriel Gomila Salas on 06/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hola Mundo")
            .fontWeight(.bold)
            .font(.system(size: 45, design: .rounded))
            .foregroundColor(.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
