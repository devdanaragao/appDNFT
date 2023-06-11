//
//  LoginVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 08/06/2023.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    var loginScreen: LoginScreen?
    var auth: Auth?
    var alert: AlertController?
    
    override func loadView() {
        loginScreen = LoginScreen()
        alert = AlertController(controller: self)
        view = loginScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        loginScreen?.delegate(delegate: self)
        loginScreen?.configTextFieldDelegate(delegate: self)
        isEnableLoginButton(false)
    }
    
    func validateTextFields() {
        if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) &&
            (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnableLoginButton(true)
        } else {
            isEnableLoginButton(false)
        }
    }
    
    func isEnableLoginButton(_ isEnable: Bool) {
        if isEnable {
            loginScreen?.loginButton.setTitleColor(.white, for: .normal)
            loginScreen?.loginButton.isEnabled = true
            loginScreen?.bgButton.alpha = 1
        } else {
            loginScreen?.loginButton.setTitleColor(.lightGray, for: .normal)
            loginScreen?.loginButton.isEnabled = false
            loginScreen?.bgButton.alpha = 0.4
        }
    }


}

extension LoginVC: LoginScreenProtocol {
    func pressLoginButton() {
        auth?.signIn(withEmail: loginScreen?.emailTextField.text ?? "", password: loginScreen?.emailTextField.text ?? "", completion: { user, error in if error != nil {
            
            // error / completion nao e obrigatorio usar, deixamos ele de modo opcional no alert.
            self.alert?.getAlert(title: "Falha no Login", message: error?.localizedDescription ?? "")
        } else {
            // sucess
        }
            
        })
    }
    
    func pressRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
        
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.white.cgColor
        } else {
            switch textField {
            case self.loginScreen?.emailTextField:
                if (loginScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    loginScreen?.emailTextField.layer.borderWidth = 2
                    loginScreen?.emailTextField.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
                } else {
                    loginScreen?.emailTextField.layer.borderWidth = 2.0
                    loginScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                }
            case self.loginScreen?.passwordTextField:
                if (loginScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
                    loginScreen?.passwordTextField.layer.borderWidth = 2
                    loginScreen?.passwordTextField.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
                } else {
                    loginScreen?.passwordTextField.layer.borderWidth = 2.0
                    loginScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                }
            default:
                break
            }
        }
        validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
