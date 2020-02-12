//
//  ContentView.swift
//  04-ScrollCardView
//
//  Created by Juan Gabriel Gomila Salas on 12/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("logo-udemy")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.padding(-40)
                .frame(height: 50)
            
            Text("Juan Gabriel Gomila")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text("UCI, Profesor Universitario y CEO de Frogames")
                .fontWeight(.light)
                .foregroundColor(.secondary)
            Text("139.245 estudiantes - 59 cursos - 23.535 reseñas")
                .font(.system(.footnote, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.secondary)
        
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            
            
            HStack{
            CardView(imageName: "swift", authorName: "Juan Gabriel Gomila", courseTitle: "Diseño de apps para iOS 13 con Swift UI desde cero", originalPrice: "199.99€", discountPrice: "10.99€")
                .frame(width:300)
            
             CardView(imageName: "videogames", authorName: "Juan Gabriel Gomila", courseTitle: "Curso completo de videojuegos con Unity 2019", originalPrice: "199.99€", discountPrice: "11.99€")
                .frame(width:300)
            
             CardView(imageName: "maths", authorName: "Ricardo Alberich, Juan Gabriel Gomila y Arnau Mir", courseTitle: "Curso de Probabilidad y Variables Aleatorias para Machine Learning", originalPrice: "199.99€", discountPrice: "12.99€")
                .frame(width:300)
            
             CardView(imageName: "python", authorName: "Juan Gabriel Gomila y Llorenç Valverde", courseTitle: "Resuelve problemas de matemáticas con Sage y Python", originalPrice: "99.99€", discountPrice: "10.99€")
                .frame(width:300)
            }
            Spacer()
        }
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                
                
                HStack{
                CardView(imageName: "swift", authorName: "Juan Gabriel Gomila", courseTitle: "Diseño de apps para iOS 13 con Swift UI desde cero", originalPrice: "199.99€", discountPrice: "10.99€")
                    .frame(width:300)
                
                 CardView(imageName: "videogames", authorName: "Juan Gabriel Gomila", courseTitle: "Curso completo de videojuegos con Unity 2019", originalPrice: "199.99€", discountPrice: "11.99€")
                    .frame(width:300)
                
                 CardView(imageName: "maths", authorName: "Ricardo Alberich, Juan Gabriel Gomila y Arnau Mir", courseTitle: "Curso de Probabilidad y Variables Aleatorias para Machine Learning", originalPrice: "199.99€", discountPrice: "12.99€")
                    .frame(width:300)
                
                 CardView(imageName: "python", authorName: "Juan Gabriel Gomila y Llorenç Valverde", courseTitle: "Resuelve problemas de matemáticas con Sage y Python", originalPrice: "99.99€", discountPrice: "10.99€")
                    .frame(width:300)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
