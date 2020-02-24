//
//  ContentView.swift
//  12-modals
//
//  Created by Juan Gabriel Gomila Salas on 20/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//


import SwiftUI

struct ContentView: View {
    
    //@State var showModalView = false
    
    @State var selectedCourse: Course?
    

    var body: some View {
        NavigationView{
            List(CourseFactory.courses){ course in
                CourseFullImageRow(course: course)
                    .onTapGesture {
                        self.selectedCourse = course
                }
            }
            .sheet(item: self.$selectedCourse){ course in
                DetailView(course: course)
            }
            .navigationBarTitle("Cursos online de JB", displayMode: .automatic)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
                .clipped()
                .cornerRadius(30)
            
            Text(course.name)
                .frame(width:300)
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
