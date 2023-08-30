//
//  ContentView.swift
//  P2-Tinder
//
//  Created by Juan Gabriel Gomila Salas on 03/03/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private let threshold: CGFloat = 100
    
    @GestureState private var dragState = DragState.none
    
    @State private var lastCardIdx = 1
    
    @State var deck : [CardView] = {
        
        var cards = [CardView]()
        
        for idx in 0..<2{
            cards.append(CardView(course: courses[idx]))
        }
        
        return cards
    }()
    
    @State private var removalTransition = AnyTransition.leadingBottomAtRemoval
    
    var body: some View {
        VStack{
            TopBarView()
            Spacer(minLength: 10)
            ZStack{
                ForEach(deck) { card in
                    card
                        .zIndex(self.isTopCard(card: card) ? 1 : 0)
                        .overlay(
                            ZStack{
                                
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size: 80))
                                    .opacity(self.dragState.translation.width < -self.threshold && self.isTopCard(card: card) ? 1 : 0)
                                
                                Image(systemName: "heart.circle.fill")
                                    .foregroundColor(.white)
                                    .font(.system(size:80))
                                    .opacity(self.dragState.translation.width > self.threshold && self.isTopCard(card: card) ? 1 : 0)
                                
                            }
                        )
                        .offset(x: self.isTopCard(card: card) ? self.dragState.translation.width : 0,
                                y: self.isTopCard(card: card) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(card: card) ? 0.9 : 1.0)
                        .rotationEffect(Angle(degrees: Double(self.isTopCard(card: card) ? self.dragState.translation.width/10 : 0)))
                        .animation(.interpolatingSpring(stiffness: 200, damping: 100), value: self.dragState.translation)
                        .transition(self.removalTransition)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                            .onChanged{ (value) in
                                guard case .second(true, let drag?) = value else{
                                    return
                                }
                                
                                self.removalTransition = drag.translation.width > 0 ? .trailingBottomAtRemoval : .leadingBottomAtRemoval
                            }
                            .onEnded{ (value) in
                                guard case .second(true, let drag?) = value else{
                                    return
                                }
                                
                                if drag.translation.width > self.threshold ||
                                    drag.translation.width < -self.threshold{
                                    //TODO: marcar el curso como X o como corazón
                                    self.updateDeck()
                                }
                            }
                        )
                }
            }
            BottomBarView()
                .opacity(self.dragState.isDragging ? 0.1 : 1.0)
                .animation(.linear, value: self.dragState.isDragging)
        }
    }
    
    
    
    private func isTopCard(card: CardView) -> Bool {
        guard let idx = deck.firstIndex(where: {$0.id == card.id}) else{
            return false
        }
        
        //Si llegamos aquí, está en el mazo
        return idx == 0
        
    }
    
    
    private func updateDeck(){
        deck.removeFirst()
        self.lastCardIdx += 1
        
        let newCourse = courses[self.lastCardIdx % courses.count]
        let newCardView = CardView(course: newCourse)
        
        deck.append(newCardView)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            TopBarView().previewLayout(.sizeThatFits)
            BottomBarView().previewLayout(.fixed(width: 300, height: 100))
        }
    }
}


struct TopBarView: View {
    var body: some View{
        HStack{
            Image(systemName: "line.horizontal.3")
                .font(.system(size: 25))
                .foregroundColor(.black)
            Spacer()
            Image(systemName: "book.fill")
                .font(.system(size: 35))
                .foregroundColor(.black)

            Spacer()
            Image(systemName: "archivebox.fill")
                .font(.system(size: 25))
                .foregroundColor(.black)

            
        }.padding(15)
    }
}

struct BottomBarView: View{
    var body: some View{
        HStack{
            Image(systemName: "xmark")
                .font(.system(size: 25))
                .foregroundColor(.black)
            Spacer()
            
            Button(action: {
                //TODO: comprar el curso
            }, label: {
                Text("Comprar el curso")
                .bold()
                .foregroundColor(.white)
                .padding(.all, 20)
                .background(Color.black)
                .cornerRadius(12)
            })
            .padding(15)
            
            Spacer()
            Image(systemName: "heart")
                .font(.system(size: 25))
                .foregroundColor(.black)
        }.padding(15)
    }
}



