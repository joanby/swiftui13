//
//  ContentView.swift
//  05-buttons
//
//  Created by Juan Gabriel Gomila Salas on 12/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        VStack {
            /*Button(action: {
                //Qué debe hacer el botón
                print("Botón hola pulsado!!!")
            }) {
                //Cómo debe verse el botón
                Text("¡Hola mundo!")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                    
                    .padding(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.green, lineWidth: 5)
                )

                
            }*/
            
            
            Button(action: {
                print("Editar pulsado")
            }){
                HStack{
                    Image(systemName: "square.and.pencil")
                    
                    Text("Editar")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(BasicButtonStyle())
            
            Button(action: {
                print("Eliminar pulsado")
            }){
                HStack{
                    Image(systemName: "trash")
                    
                    Text("Eliminar")
                        .fontWeight(.bold)
                }
            }
            .buttonStyle(BasicButtonStyle())
            
            Button(action: {
                print("Compartir pulsado")
            }){
                HStack{
                    Image(systemName: "square.and.arrow.up")
                    
                    Text("Compartir")
                        .fontWeight(.bold)
                }
            }
        .buttonStyle(BasicButtonStyle())
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BasicButtonStyle: ButtonStyle{
    
    
    func makeBody(configuration: Self.Configuration) -> some View{
        configuration.label
            .frame(minWidth:0, maxWidth: .infinity)
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color("Dark Ocean 1"), Color("Dark Ocean 2")]),
                                       startPoint: .leading, endPoint: .trailing))
            .font(.largeTitle)
            .foregroundColor(.white)
            .cornerRadius(45)
            .shadow(color: .blue, radius: 10.0, x: 20, y: 5)
            .padding(.horizontal, 15)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
    }
    
    
}
