//
//  LoadingView.swift
//  08-anims
//
//  Created by Juan Gabriel Gomila Salas on 18/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        ZStack{
            Circle()
                .stroke(Color(.systemGray6), lineWidth: 16)
                .frame(width:150, height: 150)
            Circle()
                .trim(from: 0.0, to: 0.3)
                .stroke(Color.green, lineWidth: 8)
                .frame(width: 150, height: 150)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value:self.isLoading)
                .onAppear(){
                    self.isLoading = true
                }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
