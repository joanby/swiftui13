//
//  LoadingBarView.swift
//  08-anims
//
//  Created by Juan Gabriel Gomila Salas on 18/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct LoadingBarView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack{
            Text("Cargando")
                .font(.system(.title, design: .rounded))
                .bold()
                .offset(x: 0, y: -30)
            
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color(.systemGray6), lineWidth: 5)
                .frame(width: 300, height: 4)
            
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 50, height: 4)
                .offset(x: isLoading ? 125 : -125, y: 0)
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value:self.isLoading)
                .onAppear(){
                    self.isLoading = true
            }
        }
    }
}

struct LoadingBarView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBarView()
    }
}
