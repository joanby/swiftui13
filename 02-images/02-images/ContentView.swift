//
//  ContentView.swift
//  02-images
//
//  Created by Juan Gabriel Gomila Salas on 06/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Image("newyork")
            .resizable()
          //.edgesIgnoringSafeArea(.vertical)
          //.scaledToFit()
            .aspectRatio(contentMode: .fill)
            .frame(width:300)
          //.clipped()
            .clipShape(Capsule())
            .opacity(0.9)
            .overlay(
                /*Image(systemName: "heart.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.pink)
                    .opacity(0.5)*/
                
                /*Text("Qué ganas de volver a Nueva York, sentir el frío en invierno y pasear por Central Park con un buen bagel en la mano!")
                    .fontWeight(.bold)
                    .font(.system(.headline, design:.rounded))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .opacity(0.7)
                    .padding(),
                alignment: .bottom*/
                Capsule()
                    .foregroundColor(.gray)
                    .opacity(0.5)
                    .overlay(
                        Text("Nueva York")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 250)
                
                    )
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
