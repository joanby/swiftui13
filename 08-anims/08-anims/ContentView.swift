//
//  ContentView.swift
//  08-anims
//
//  Created by Juan Gabriel Gomila Salas on 17/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var buttonColorChanged = false
    @State private var iconColorChanged = false
    @State private var iconSizeChanged = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 180, height: 180)
                .foregroundColor(buttonColorChanged ? Color(.systemGray4) : .green)
            
            Image(systemName: "keyboard")
                .font(.system(size:80))
                .foregroundColor(iconColorChanged ? .green : Color(.systemGray6))
                .scaleEffect(iconSizeChanged ? 1.0 : 0.5)
        }
        //.animation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.5))
        .onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 0.5)) {
                self.buttonColorChanged.toggle()
                self.iconColorChanged.toggle()
            }
            
            self.iconSizeChanged.toggle()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
