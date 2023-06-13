//
//  RegisterScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 08/06/2023.
//

import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func pressRegisterButton()
    func pressLoginButton()
}


class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
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
    
    lazy var nameTextField: UITextField = {
        let name = UITextField()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.autocorrectionType = .no
        name.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        name.borderStyle = .roundedRect
        name.keyboardType = .emailAddress
        name.attributedPlaceholder = NSAttributedString(string: "Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        name.textColor = .white
        name.clipsToBounds = true
        name.layer.cornerRadius = 12
        name.layer.borderWidth = 2.0
        name.layer.borderColor = UIColor.white.cgColor
        return name
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
    
//    lazy var genderTextField: UITextField = {
//        let gender = UITextField()
//        gender.translatesAutoresizingMaskIntoConstraints = false
//        gender.autocorrectionType = .no
//        gender.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
//        gender.borderStyle = .roundedRect
//        gender.keyboardType = .emailAddress
//        gender.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
//        gender.textColor = .white
//        gender.clipsToBounds = true
//        gender.layer.cornerRadius = 12
//        gender.layer.borderWidth = 2.0
//        gender.layer.borderColor = UIColor(red: 142/255, green: 217/255, blue: 17/255, alpha: 1.0).cgColor
//        return gender
//    }()
    
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
    
    lazy var bgButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bgButton")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(pressRegisterButton), for: .touchUpInside)
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
    
    lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(pressLoginButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pressRegisterButton(_ sender: UIButton) {
        delegate?.pressRegisterButton()
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
        addSubview(logoApp)
        addSubview(loginLabel)
        addSubview(descriptionLabel)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(bgButton)
        addSubview(registerButton)
        addSubview(lineView)
        addSubview(signUpView)
        addSubview(loginButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            logoApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -50),
            logoApp.heightAnchor.constraint(equalToConstant: 350),
            logoApp.widthAnchor.constraint(equalToConstant: 350),
            logoApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: logoApp.bottomAnchor, constant: -105),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            nameTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 39),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor ),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: nameTextField.heightAnchor),
            
            bgButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 36),
            bgButton.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            bgButton.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            bgButton.heightAnchor.constraint(equalToConstant: 43),
            
            registerButton.topAnchor.constraint(equalTo: bgButton.topAnchor),
            registerButton.leadingAnchor.constraint(equalTo: bgButton.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: bgButton.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: bgButton.bottomAnchor),
            
            lineView.topAnchor.constraint(equalTo: bgButton.bottomAnchor, constant: 48),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            signUpView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 48),
            signUpView.leadingAnchor.constraint(equalTo: bgButton.leadingAnchor),
            signUpView.trailingAnchor.constraint(equalTo: bgButton.trailingAnchor),
            signUpView.heightAnchor.constraint(equalToConstant: 41),
            
            loginButton.topAnchor.constraint(equalTo: signUpView.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: signUpView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: signUpView.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: signUpView.bottomAnchor),
        ])
    }
    
    func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
}
