//
//  LoginVM.swift
//  appDNFT
//
//  Created by Danilo Santos on 11/06/2023.
//

import UIKit
import Firebase

protocol LoginVMProtocol: AnyObject {
    func sucessLogin()
    func errorLogin(errorMessage: String)
}

class LoginVM {
    
        private weak var delegate: LoginVMProtocol?
        
        private var auth = Auth.auth()
        
        public func delegate(delegate: LoginVMProtocol?) {
            self.delegate = delegate
        }
    
    public func loginUser(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("sucesso login")
                self.delegate?.sucessLogin()
            } else {
                print("Error cadastro, error: \(error?.localizedDescription ?? "")")
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}
