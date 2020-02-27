//
//  ContentView.swift
//  13-forms
//
//  Created by Juan Gabriel Gomila Salas on 24/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var courses = [
        Course(name: "Probabilidad y Variables Aleatorias para ML e IA", image: "maths", type: "Matemáticas", priceLevel: 4),
        Course(name: "Machine Learning de la A a la Z", image: "ml_az", type: "Machine Learning", priceLevel: 5, featured: true),
        Course(name: "Resuelve problemas de Matemáticas con Sage y Python", image: "python", type:"Matemáticas", priceLevel: 2),
        Course(name: "Aprueba la Selectividad con problemas resueltos", image: "selectividad", type: "Matemáticas", priceLevel: 2, purchased: true),
        Course(name: "Curso de introducción a Swift UI desde cero", image: "swift", type: "Desarrollo de Apps", priceLevel: 1, featured: true, purchased: true),
        Course(name: "TensorFlow 2: Curso de Actualización Completo", image: "tensorflow2", type: "Machine Learning", priceLevel: 4),
        Course(name: "Curso Completo de Unreal Engine de cero a experto", image: "unrealengine", type: "Videojuegos", priceLevel: 4),
        Course(name: "Curso de Unity 2019: Aprende a crear juegos de rol", image: "videogames", type: "Videojuegos", priceLevel: 3, purchased: true)
    ]
        
    @State private var selectedCourse: Course?
    
    @State private var showSettingsView: Bool = false
    
    @EnvironmentObject var settings: SettingsFactory
    
    
    var body: some View {
        NavigationView{
            List{
                ForEach(courses
                    .filter(shouldShowCourse)
                    .sorted(by: self.settings.order.predicateSort())){ course in
                    ZStack{
                                                
                        CourseRoundImageRow(course:course)
                            .contextMenu{
                                
                                Button(action: {
                                    self.setPurchased(item: course)
                                }) {
                                    HStack{
                                        Text("Comprar")
                                        Image(systemName: "checkmark.circle")
                                    }
                                }
                                
                                Button(action: {
                                    self.setFeatured(item: course)
                                }) {
                                    HStack{
                                        Text("Destacar")
                                        Image(systemName: "star")
                                    }
                                }
                                
                                Button(action: {
                                    self.delete(item: course)
                                }) {
                                    HStack{
                                        Text("Eliminar")
                                        Image(systemName: "trash")
                                    }
                                }
                        }
                        .onTapGesture {
                            self.selectedCourse = course
                        }
                        .actionSheet(item: self.$selectedCourse){ _ in
                            ActionSheet(title: Text("Indica tu acción a realizar"),
                                        message: nil,
                                        buttons: [
                                            .default(Text("Marcar como favorito"), action: {
                                                if let selectedCourse = self.selectedCourse {
                                                    self.setFeatured(item: selectedCourse)
                                                }
                                            }),
                                            .destructive(Text("Eliminar curso"), action: {
                                                if let selectedCourse = self.selectedCourse {
                                                    self.delete(item: selectedCourse)
                                                }
                                            }),
                                            //TODO: colocar aquí más opciones si se desea
                                            .cancel()
                            ])
                        }
                        
                        
                        /*NavigationLink(destination: DetailView(course: course)){
                            EmptyView()
                        }*/
                    }
                }.onDelete{ (indexSet) in
                    self.courses.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Cursos online de JB", displayMode: .automatic)
            .navigationBarItems(trailing:
                Button(action: {
                    self.showSettingsView = true
                }, label: {
                    
                    Image(systemName: "line.horizontal.3.decrease.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                })
            )
            .sheet(isPresented: $showSettingsView){
                SettingsView().environmentObject(self.settings)
            }
            
            }
    }
    
    
    private func setFeatured(item course: Course){
        if let idx = self.courses.firstIndex(where: {$0.id == course.id}){
            self.courses[idx].featured.toggle()
        }
    }
    
    private func setPurchased(item course:Course){
        if let idx = self.courses.firstIndex(where: {$0.id == course.id}){
            self.courses[idx].purchased.toggle()
        }
    }
    
    private func delete(item course: Course){
        if let idx = self.courses.firstIndex(where: {$0.id == course.id}){
            self.courses.remove(at: idx)
        }
    }
    
    
    private func shouldShowCourse(course: Course) -> Bool {
        let checkPurchased = (self.settings.showPurchasedOnly && course.purchased) || !self.settings.showPurchasedOnly
        let checkPrice = (course.priceLevel <= self.settings.maxPrice)
        return checkPurchased && checkPrice
    }
    
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingsFactory())
    }
}



struct CourseRoundImageRow: View {
    var course : Course
    var body: some View {
        HStack {
            Image(course.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack{
                    Text(course.name)
                        .font(.system(.body, design:.rounded))
                        .bold()
                    
                    Text(String(repeating: "€", count: course.priceLevel))
                        .font(.subheadline)
                    .foregroundColor(.gray)
                }
                
                Text(course.type)
                    .font(.system(.subheadline, design: .rounded))
                .bold()
                    .foregroundColor(.secondary)
            }
            Spacer().layoutPriority(-10)
            
            if course.featured {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            
            if course.purchased {
                Spacer()
                
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
            
        }
    }
}
