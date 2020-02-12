//
//  ContentView.swift
//  03-stacks
//
//  Created by Juan Gabriel Gomila Salas on 11/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HeaderView()
            
            HStack(spacing:8) {
                PricingView(title: "Básico", subtitle: "Un curso incluido", price: "9.99€", textColor: .white, backgroundColor: .green)
                ZStack{
                    PricingView(title: "Carrera", subtitle: "Toda una carrera", price: "29.99€", textColor: .black, backgroundColor: Color(red: 230/255, green: 230/255, blue:230/255))
                    
                    Text("El mejor para empezar")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                    .padding(8)
                        .background(Color(red:240/255, green: 180/255, blue:50/255))
                    .offset(x: 0, y: -85)
                }
            }.padding(.horizontal)
            
            
            
            ZStack{
                PricingView(title: "Definitivo", subtitle: "Todos los cursos online", price: "99.99€", textColor: .white, backgroundColor: Color(red:50/255, green: 50/255, blue:50/255), icon: "lightbulb").padding(.horizontal)
                
                Text("Conviertete en un máster del universo")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.black)
                .padding(8)
                    .background(Color(red:240/255, green: 180/255, blue:50/255))
                .offset(x: 0, y: -88)
                
                
            }.padding(.vertical)
            
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct HeaderView: View {
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 4){
                Text("Elige tu itinerario")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                
                
                Text("de aprendizaje")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
        }
        .padding()
    }
}

struct PricingView: View {
    
    var title: String
    var subtitle: String
    var price: String
    var textColor: Color
    var backgroundColor: Color
    var icon: String?
    
    var body: some View {
        VStack{
            
            icon.map({
                Image(systemName:$0) //$0 = icon
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
            
            Text(title)
                .font(.system(.title, design:.rounded))
                .fontWeight(.bold)
                .foregroundColor(textColor)
            
            Text(price)
                .font(.system(size: 34, weight:.heavy, design:.rounded))
                .foregroundColor(textColor)
            
            Text(subtitle)
                .font(.headline)
                .foregroundColor(textColor)
            
        }.frame(minWidth:0, maxWidth: .infinity, minHeight: 100)
            .padding(30)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
