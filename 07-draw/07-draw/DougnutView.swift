//
//  DougnutView.swift
//  07-draw
//
//  Created by Juan Gabriel Gomila Salas on 15/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct DougnutView: View {
    var body: some View {
        ZStack{
          Circle()
            .trim(from: 0.0, to: 0.3)
            .stroke(Color(.brown), lineWidth: 60)
            
            Circle()
                .trim(from:0.30, to:0.5)
                .stroke(Color(.systemPink), lineWidth: 60)
            
            Circle()
                .trim(from:0.50, to:0.75)
                .stroke(Color(.orange), lineWidth: 60)
            
            Circle()
                .trim(from:0.75, to:1.00)
                .stroke(Color(.red), lineWidth: 70)
            .overlay(
                Text("25%")
                    .font(.system(.title, design:.rounded))
                .bold()
                .foregroundColor(.white)
                .offset(x:90, y:-90)
            )
            
        }
        .frame(width:250, height:250)
    }
}

struct DougnutView_Previews: PreviewProvider {
    static var previews: some View {
        DougnutView()
    }
}
