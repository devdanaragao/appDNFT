//
//  RegisterVM.swift
//  appDNFT
//
//  Created by Danilo Santos on 11/06/2023.
//

import UIKit
import Firebase

protocol RegisterVMProtocol: AnyObject {
    func sucessRegister()
    func errorRegister(errorMessage: String)
}

class RegisterVM {
    
        private weak var delegate: RegisterVMProtocol?
        
        private var auth = Auth.auth()
        
        public func delegate(delegate: RegisterVMProtocol?) {
            self.delegate = delegate
        }
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("sucesso cadastro")
                self.delegate?.sucessRegister()
            } else {
                print("Error cadastro, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}
