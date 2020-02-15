//
//  ClickView.swift
//  06-states_bindings
//
//  Created by Juan Gabriel Gomila Salas on 15/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ClickView: View {
    
    @State private var numClicks1 = 0
    @State private var numClicks2 = 0
    @State private var numClicks3 = 0
    
    var body: some View {
        VStack {
            Text("\(numClicks1+numClicks2+numClicks3)")
                .font(.system(size:100, weight:.black, design:.rounded))
            CounterView(numClicks: $numClicks1, buttonColor: .purple)
            CounterView(numClicks: $numClicks2, buttonColor: .yellow)
            CounterView(numClicks: $numClicks3, buttonColor: .green)
        }
    }
}

struct ClickView_Previews: PreviewProvider {
    static var previews: some View {
        ClickView()
    }
}

struct CounterView: View {
    
    @Binding var numClicks: Int
    
    var buttonColor: Color
    
    var body: some View {
        Button(action:{
            self.numClicks += 1
        }){
            Circle()
                .frame(width: 150, height: 150)
                .foregroundColor(buttonColor)
                .overlay(Text("\(numClicks)")
                    .font(.system(size:80, weight:.bold, design:.rounded))
                    .foregroundColor(.white)
            )
        }
    }
}
