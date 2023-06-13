//
//  RegisterVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 08/06/2023.
//

import UIKit
import FirebaseAuth

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    
    private var viewModel: RegisterVM = RegisterVM()

    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboard()
        registerScreen?.delegate(delegate: self)
        registerScreen?.configTextFieldDelegate(delegate: self)
        viewModel.delegate(delegate: self)
        isEnableRegisterButton(false)

    }
    
    func validateTextFields() {
        if (registerScreen?.emailTextField.text ?? "").isValid(validType: .email) &&
            (registerScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
            isEnableRegisterButton(true)
        } else {
            isEnableRegisterButton(false)
        }
    }
    
    func isEnableRegisterButton(_ isEnable: Bool) {
        if isEnable {
            registerScreen?.registerButton.setTitleColor(.white, for: .normal)
            registerScreen?.registerButton.isEnabled = true
            registerScreen?.bgButton.alpha = 1
        } else {
            registerScreen?.registerButton.setTitleColor(.lightGray, for: .normal)
            registerScreen?.registerButton.isEnabled = false
            registerScreen?.bgButton.alpha = 0.4
        }
    }

}

extension RegisterVC: RegisterScreenProtocol {
    
    func pressRegisterButton() {
        viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "")
}

    
    func pressLoginButton() {
        let vc: LoginVC = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}

extension RegisterVC: RegisterVMProtocol {
    func sucessRegister() {
        print("Sucess")
    }
    
    func errorRegister(errorMessage: String) {
        AlertController(controller: self).getAlert(title: "Ops, error Cadastro!", message: errorMessage)
    }
    
    
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            textField.layer.borderWidth = 2
            textField.layer.borderColor = UIColor.white.cgColor
        } else {
            switch textField {
            case self.registerScreen?.nameTextField:
                if (registerScreen?.nameTextField.text ?? "").isValid(validType: .name) {
                    registerScreen?.nameTextField.layer.borderWidth = 2
                    registerScreen?.nameTextField.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
                } else {
                    registerScreen?.nameTextField.layer.borderWidth = 2.0
                    registerScreen?.nameTextField.layer.borderColor = UIColor.white.cgColor
                }
            case self.registerScreen?.emailTextField:
                if (registerScreen?.emailTextField.text ?? "").isValid(validType: .email) {
                    registerScreen?.emailTextField.layer.borderWidth = 2
                    registerScreen?.emailTextField.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
                } else {
                    registerScreen?.emailTextField.layer.borderWidth = 2.0
                    registerScreen?.emailTextField.layer.borderColor = UIColor.white.cgColor
                }
            case self.registerScreen?.passwordTextField:
                if (registerScreen?.passwordTextField.text ?? "").isValid(validType: .password) {
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
        validateTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
