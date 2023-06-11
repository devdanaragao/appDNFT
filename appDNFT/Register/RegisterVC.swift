//
//  RegisterVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 08/06/2023.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?

    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)

    }

}

extension RegisterVC: RegisterScreenProtocol {
    func pressRegisterButton() {
        print(#function)
    }
    
    func pressLoginButton() {
        let vc: LoginVC = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.white.cgColor
        } else {
            switch textField {
            case self.registerScreen?.emailTextField:
                if (registerScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    registerScreen?.emailTextField.layer.borderWidth = 2
                    registerScreen?.emailTextField.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
                } else {
                    registerScreen?.emailTextField.layer.borderWidth = 2.0
                    registerScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                }
            case self.registerScreen?.nameTextField:
                if (registerScreen?.nameTextField.text ?? "").isValid(validType: .password) {
                    registerScreen?.nameTextField.layer.borderWidth = 2
                    registerScreen?.nameTextField.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
                } else {
                    registerScreen?.nameTextField.layer.borderWidth = 2.0
                    registerScreen?.nameTextField.layer.borderColor = UIColor.white.cgColor
                }
            case self.registerScreen?.passwordTextField:
                if (registerScreen?.passwordTextField.text ?? "").isValid(validType: .name) {
                    registerScreen?.passwordTextField.layer.borderWidth = 2
                    registerScreen?.passwordTextField.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
                } else {
                    registerScreen?.passwordTextField.layer.borderWidth = 2.0
                    registerScreen?.passwordTextField.layer.borderColor = UIColor.white.cgColor
                }
            default:
                break
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
