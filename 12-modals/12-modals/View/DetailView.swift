//
//  DetailView.swift
//  11-navigation
//
//  Created by Juan Gabriel Gomila Salas on 20/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showAlertView = false
    
    var course: Course
    
    var body: some View {
        ScrollView{
            VStack{
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(course.name)
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                    .multilineTextAlignment(.center)
                    .frame(width:300)
                    .lineLimit(3)
                
                Text(course.description)
                    .font(.system(.body, design: .rounded))
                    .padding()
                
                Spacer()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .overlay(
            HStack{
                Spacer()
                
                VStack{
                Button(action:{
                    self.showAlertView = true
                }, label: {
                    Image(systemName: "chevron.down.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                })
                .padding(.trailing, 20)
                .padding(.top, 20)
                    
                    Spacer()
                }
            }
        )
        .alert(isPresented: $showAlertView){
            Alert(title: Text("¡Cuidado!"),
            message: Text("¿Estás seguro de cerrar esta ventana?"),
            primaryButton: .default(Text("Si"), action: {self.presentationMode.wrappedValue.dismiss()}),
            secondaryButton: .cancel(Text("No")))
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(course: Course(name: "Curso completo de iOS 13 con Swift UI", image: "swift"))
    }
}
