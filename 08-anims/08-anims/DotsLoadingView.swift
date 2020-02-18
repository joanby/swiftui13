//
//  DotsLoadingView.swift
//  08-anims
//
//  Created by Juan Gabriel Gomila Salas on 18/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct DotsLoadingView: View {
    
    @State private var isLoading = false
    
    var body: some View {
        HStack{
            ForEach(0...5, id: \.self){ index in
                Circle()
                    .frame(width: 16, height: 16)
                    .foregroundColor(Color.green)
                    .scaleEffect(self.isLoading ? 0 : 1)
                    .animation(Animation.linear(duration: 0.5).repeatForever().delay(Double(index)/6))
            }
        }.onAppear(){
            self.isLoading = true
        }
    }
}

struct DotsLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        DotsLoadingView()
    }
}
