//
//  LoginScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 08/06/2023.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func pressRegisterButton()
    func pressLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
//    lazy var bgLogin: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(named: "bgLogin")
//        return image
//    }()
    
    lazy var logoApp: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "danAPP")
        return image
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0) /*#fab908 */
        label.font = UIFont(name: "impact", size: 40)
        label.text = "D-NFTs"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .center
        label.text = "Buy, sell and showcase NFTs"
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        email.autocorrectionType = .no
        email.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        email.borderStyle = .roundedRect
        email.keyboardType = .emailAddress
        email.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        email.textColor = .white
        email.clipsToBounds = true
        email.layer.cornerRadius = 12
        email.layer.borderWidth = 2.0
        email.layer.borderColor = UIColor.white.cgColor
        return email
    }()
    
    lazy var passwordTextField: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.autocorrectionType = .no
        password.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        password.borderStyle = .roundedRect
        password.keyboardType = .default
        password.isSecureTextEntry = true
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        password.textColor = .white
        password.clipsToBounds = true
        password.layer.cornerRadius = 12
        password.layer.borderWidth = 2.0
        password.layer.borderColor = UIColor.white.cgColor
        return password
    }()
    
    lazy var recoverPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Recover Password?", for: .normal)
        button.setTitleColor(UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0) /* #fab908 */, for: .normal)
        button.addTarget(self, action: #selector(pressRecoverPasswordButton), for: .touchUpInside)
        return button
    }()
    
    lazy var bgButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bgButton")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(pressLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var signUpView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor /* #fab908 */
        view.layer.borderWidth = 2
        return view
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(pressRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pressRegisterButton(_ sender: UIButton) {
        delegate?.pressRegisterButton()
    }
    
    @objc func pressRecoverPasswordButton(_ sender: UIButton) {
        print(#function)
    }
    
    @objc func pressLoginButton(_ sender: UIButton) {
        delegate?.pressLoginButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        bgGradient()
        addElements()
        configConstraints()
    }
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bgGradient() {
//        translatesAutoresizingMaskIntoConstraints = false
        if let layer = self.layer as? CAGradientLayer {
            layer.colors = [UIColor(red: 3/255, green: 187/255, blue: 255/255, alpha: 1.0).cgColor, UIColor(red: 184/255, green: 95/255, blue: 233/255, alpha: 1.0).cgColor]
            layer.locations = [0.0, 1.0]
            layer.type = .axial
            layer.startPoint = CGPoint(x: 0.50, y: 1.20)
            layer.endPoint = CGPoint(x: 0.40, y: 0)
        }
    }
    
    private func addElements() {
//        addSubview(bgLogin)
        addSubview(logoApp)
        addSubview(loginLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(recoverPasswordButton)
        addSubview(bgButton)
        addSubview(loginButton)
        addSubview(lineView)
        addSubview(signUpView)
        signUpView.addSubview(registerButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
//            bgLogin.topAnchor.constraint(equalTo: topAnchor),
//            bgLogin.leadingAnchor.constraint(equalTo: leadingAnchor),
//            bgLogin.trailingAnchor.constraint(equalTo: trailingAnchor),
//            bgLogin.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -50),
            logoApp.heightAnchor.constraint(equalToConstant: 350),
            logoApp.widthAnchor.constraint(equalToConstant: 350),
            logoApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: logoApp.bottomAnchor, constant: -105),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 39),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            recoverPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            recoverPasswordButton.heightAnchor.constraint(equalToConstant: 16),
            
            bgButton.topAnchor.constraint(equalTo: recoverPasswordButton.bottomAnchor, constant: 36),
            bgButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            bgButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            bgButton.heightAnchor.constraint(equalToConstant: 43),
            
            loginButton.topAnchor.constraint(equalTo: bgButton.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: bgButton.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: bgButton.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: bgButton.bottomAnchor),
            
            lineView.topAnchor.constraint(equalTo: bgButton.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signUpView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            signUpView.leadingAnchor.constraint(equalTo: bgButton.leadingAnchor),
            signUpView.trailingAnchor.constraint(equalTo: bgButton.trailingAnchor),
            signUpView.heightAnchor.constraint(equalToConstant: 41),
            
            registerButton.topAnchor.constraint(equalTo: signUpView.topAnchor),
            registerButton.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor),
            
        ])
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}

