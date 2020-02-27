//
//  RegistrationViewModel.swift
//  14-sign_up
//
//  Created by Juan Gabriel Gomila Salas on 26/02/2020.
//  Copyright © 2020 Frogames. All rights reserved.
//

import Foundation
import Combine

class RegistrationViewModel: ObservableObject{
    
    //Entrada de datos del usuario
    @Published var username = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    
    //Valores de validación del formulario
    @Published var usernameLengthValid = false
    @Published var passwordLengthValid = false
    @Published var passwordCapitalLetter = false
    @Published var passwordsMatch = false
    
    private var cancellableObjects: Set<AnyCancellable> = []
    
    
    init(){
        $username
            .receive(on: RunLoop.main)
            .map{ username in
                return username.count >= 6
            }
            .assign(to: \.usernameLengthValid, on: self)
            .store(in: &cancellableObjects)
        
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                return password.count >= 8
            }
            .assign(to: \.passwordLengthValid, on: self)
            .store(in: &cancellableObjects)

        
        $password
            .receive(on: RunLoop.main)
            .map{ password in
                let pattern = "[A-Z]" //Expresión regular de contiene mayúsculas
                if let _ = password.range(of: pattern, options: .regularExpression){
                    return true
                }else{
                    return false
                }
            }
            .assign(to: \.passwordCapitalLetter, on: self)
            .store(in: &cancellableObjects)

        
        Publishers.CombineLatest($password, $confirmPassword)
            .receive(on: RunLoop.main)
            .map{ (password, confirmPassword) in
                return !password.isEmpty && (password == confirmPassword)
            }
            .assign(to: \.passwordsMatch, on: self)
            .store(in: &cancellableObjects)

        
        
    }
    
}
