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
        Text("Soy licenciado en matemáticas, especializado en el análisis de datos para empresas de videojuegos con R y Python, en Game Design para videojuegos de social casino, en el desarrollo de aplicaciones móviles para iOS y para Android y desarrollador de videojuegos utilizando los motores Unreal Engine y Unity tanto para PC como para móvil desde el año 2011.")
            .fontWeight(.regular)
            .font(.custom("Gill Sans", size: 25))
            .foregroundColor(.blue)
            .multilineTextAlignment(.center)
            .lineLimit(nil)
            .truncationMode(.middle)
            .lineSpacing(8).padding()
//            .rotationEffect(.degrees(15), anchor: UnitPoint(x: 0, y: 0))
            .rotation3DEffect(.degrees(50), axis: (x: 1, y: 0, z: 0))
            .shadow(color: .gray, radius: 1, x: 0, y: 5)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
