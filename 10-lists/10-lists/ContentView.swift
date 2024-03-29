//
//  ContentView.swift
//  10-lists
//
//  Created by Juan Gabriel Gomila Salas on 18/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var courses = [
        Course(name: "Probabilidad y Variables Aleatorias para ML e IA", image: "maths"),
        Course(name: "Machine Learning de la A a la Z", image: "ml_az"),
        Course(name: "Resuelve problemas de Matemáticas con Sage y Python", image: "python"),
        Course(name: "Aprueba la Selectividad con problemas resueltos", image: "selectividad"),
        Course(name: "Curso de introducción a Swift UI desde cero", image: "swift", feature: true),
        Course(name: "TensorFlow 2: Curso de Actualización Completo", image: "tensorflow2"),
        Course(name: "Curso Completo de Unreal Engine de cero a experto", image: "unrealengine"),
        Course(name: "Curso de Unity 2019: Aprende a crear juegos de rol", image: "videogames")
    ]
    
    var body: some View {
        ForEach(0..<courses.count, id: \.self){ idx in
            if self.courses[idx].feature{
                CourseFullImageRow(course: self.courses[idx])
            }else{
                CourseRoundImageRow(course: self.courses[idx])
            }
           
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Course: Identifiable {
    var id = UUID()
    var name: String
    var image: String
    var feature: Bool = false
}

struct CourseRoundImageRow: View {
    var course : Course
    var body: some View {
        HStack {
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(30)
            
            Text(course.name)
        }
    }
}

struct CourseFullImageRow : View {
    var course: Course
    
    var body: some View {
        ZStack{
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height:200)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.gray)
                        .opacity(0.25)
            )
            
            Text(course.name)
                .font(.system(.headline, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.white )
                .multilineTextAlignment(.center)
        }
    }
}
