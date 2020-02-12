//
//  ExerciseView.swift
//  03-stacks
//
//  Created by Juan Gabriel Gomila Salas on 12/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ExerciseView: View {
     var body: some View {
           VStack {
               HeaderView()
               
            
               ZStack{
                   PricingView(title: "Básico", subtitle: "Un curso incluido", price: "9.99€", textColor: .white, backgroundColor: .green,
                               icon: "star")
                
                   ZStack{
                       PricingView(title: "Carrera", subtitle: "Toda una carrera", price: "29.99€", textColor: .black, backgroundColor: Color(red: 230/255, green: 230/255, blue:230/255),
                                   icon: "timer")
                       
                       Text("El mejor para empezar")
                           .font(.system(.caption, design: .rounded))
                           .foregroundColor(.white)
                           .fontWeight(.black)
                       .padding(8)
                           .background(Color(red:240/255, green: 180/255, blue:50/255))
                       .offset(x: 0, y: -90)
                }.offset(x: 0, y: 110)
               
               
               
               
               ZStack{
                   PricingView(title: "Definitivo", subtitle: "Todos los cursos online", price: "99.99€", textColor: .white, backgroundColor: Color(red:50/255, green: 50/255, blue:50/255), icon: "lightbulb")
                
                   
                   Text("Conviertete en un máster del universo")
                       .font(.system(.caption, design: .rounded))
                       .foregroundColor(.white)
                       .fontWeight(.black)
                   .padding(8)
                       .background(Color(red:240/255, green: 180/255, blue:50/255))
                   .offset(x: 0, y: -90)
                   
                   
               }.padding(.vertical)
                .offset(x: 0, y: 220)
               }.padding(.horizontal)
            
               Spacer()
               
           }
       }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseView()
    }
}


