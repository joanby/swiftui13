//
//  CourseDetailView.swift
//  P1-ExpandableBottomSheet
//
//  Created by Juan Gabriel Gomila Salas on 01/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct CourseDetailView: View {
    
    @GestureState private var dragState = DragState.none
    
    @State private var offset: CGFloat = 0
    
    @State private var cardState = CardState.half
    
    var course: Course
    
    @Binding var isShown: Bool
    
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                Spacer()
                
                HandleBar()
                
                TitleBar(titleText: "Detalles del Curso")
                
                ScrollView(.vertical){
                    HeaderView(course: self.course)
                    
                    DescriptionView(icon: "dollarsign.circle.fill",
                                    content: "\(self.course.priceLevel)")
                        .padding(.top)
                    
                    DescriptionView(icon: nil,
                                    content: self.course.description)
                }
                .animation(nil)
                .disabled(self.cardState == .half || self.dragState.isDragging)
            }
            .background(Color.white)
            .cornerRadius(15, antialiased: true)
            .offset(y: geometry.size.height*0.4 + self.dragState.translation.height+self.offset)
            .animation(.interpolatingSpring(stiffness: 200, damping: 50, initialVelocity: 10))
            .edgesIgnoringSafeArea(.all)
            .gesture(DragGesture()
            .updating(self.$dragState){ (value, state, transaction) in
                state = DragState.dragging(translation: value.translation)
            }
            .onEnded({ (value) in
                switch self.cardState{
                case .half:
                    //Umbral Superior, si es superado, transición a estado full
                    if value.translation.height < -0.25*geometry.size.height {
                        self.offset = -0.3*geometry.size.height
                        self.cardState = .full
                    }
                    //Umbral Inferior, si es superado, ocultar la vista
                    if value.translation.height > 0.25*geometry.size.height{
                        self.isShown = false
                    }
                    break
                    
                case .full:
                    //Umbral pequeño, si es superado transición a estado half
                    if value.translation.height > 0.25*geometry.size.height{
                        self.offset = 0
                        self.cardState = .half
                    }
                    //Umbral grande, si es superado, ocultar la tarjeta
                    if value.translation.height > 0.75*geometry.size.height {
                        self.isShown = false
                    }
                    break
                }
            })
            )
        }
        
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: courses[0], isShown: .constant(true))
            .background(Color.gray.opacity(0.5))
            .edgesIgnoringSafeArea(.all)
    }
}

struct HandleBar: View {
    var body: some View{
        Rectangle()
        .frame(width: 70, height: 8)
        .foregroundColor(Color(.systemGray4))
        .cornerRadius(8)
    }
}

struct TitleBar: View{
    var titleText: String
    var body: some View{
        Text(titleText)
        .font(.headline)
        .foregroundColor(.primary)
        .padding()
    }
}

struct HeaderView: View{
    var course: Course
    
    var body: some View{
        Image(course.image)
            .resizable()
            .scaledToFit()
            .overlay(
                HStack{
                    VStack(alignment: .leading){
                        Spacer()
                        Text(course.name)
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                            .bold()
                        Text(course.type)
                            .font(.system(.subheadline, design: .rounded))
                            .foregroundColor(.white)
                            .padding(5)
                            .background(Color.blue)
                        .cornerRadius(5)
                    }
                    Spacer()
                }
            .padding()
        )
    }
}

struct DescriptionView: View{
    var icon: String?
    var content: String
    
    var body: some View{
        HStack{
            if icon != nil{
                Image(systemName: icon!)
                    .padding(.trailing, 10)
            }
            Text(content)
                .font(.system(.body, design: .rounded))
            Spacer()
        }.padding(.horizontal)
    }
}


enum CardState {
    case half
    case full
}
