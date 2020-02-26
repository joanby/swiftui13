//
//  SettingsView.swift
//  13-forms
//
//  Created by Juan Gabriel Gomila Salas on 25/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var settings: SettingsFactory
    
    @State private var selectedOrder = SortingOrderType.alphabetical
    @State private var showPurchasedOnly = false
    @State private var maxPrice = 5 {
        didSet{
            if maxPrice > 5 {
                maxPrice = 5
            }
            
            if maxPrice < 1 {
                maxPrice = 1
            }
        }
    }
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("ORDENA LOS CURSOS")){
                    Picker(selection: $selectedOrder, label: Text("Orden de los cursos")){
                        ForEach(SortingOrderType.allCases, id: \.self){ orderType in
                            Text(orderType.description)
                        }
                    }
                }
                Section(header: Text("FILTRAR LOS CURSOS")){
                    Toggle(isOn: $showPurchasedOnly){
                        Text("Mostrar solo cursos comprados")
                    }
                    
                    Stepper(onIncrement: {
                        self.maxPrice += 1
                    }, onDecrement: {
                        self.maxPrice -= 1
                    }){
                        Text("Mostrar \(String(repeating:"€", count: maxPrice)) o menos")
                    }
                }
            }
            .navigationBarTitle("Configuración")
            .navigationBarItems(leading:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName:"arrowtriangle.down.circle")
                        .font(.title)
                        .foregroundColor(.gray)
                }),
                trailing:
                Button(action: {
                    self.settings.order = self.selectedOrder
                    self.settings.showPurchasedOnly = self.showPurchasedOnly
                    self.settings.maxPrice = self.maxPrice
                    
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "checkmark.circle.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                })
            )
        }
        .onAppear {
            self.selectedOrder = self.settings.order
            self.showPurchasedOnly = self.settings.showPurchasedOnly
            self.maxPrice = self.settings.maxPrice
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView().environmentObject(SettingsFactory())
    }
}
