//
//  HomeScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 08/06/2023.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func pressLoginButton()
    func pressRegisterButton()
}

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol?) {
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
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var bgButtonLogin: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bgButton")
        image.clipsToBounds = true
        image.layer.cornerRadius = 8
        image.contentMode = .scaleToFill
        return image
    }()
    
    lazy var bgButtonRegister: UIImageView = {
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
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(pressLoginButton), for: .touchUpInside)
        return button
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
    
    @objc func pressLoginButton(_ sender: UIButton) {
        delegate?.pressLoginButton()
    }
    
    @objc func pressRegisterButton(_ sender: UIButton) {
        delegate?.pressRegisterButton()
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
        addSubview(lineView)
        addSubview(bgButtonLogin)
        addSubview(bgButtonRegister)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
//            bgLogin.topAnchor.constraint(equalTo: topAnchor),
//            bgLogin.leadingAnchor.constraint(equalTo: leadingAnchor),
//            bgLogin.trailingAnchor.constraint(equalTo: trailingAnchor),
//            bgLogin.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -20),
            logoApp.heightAnchor.constraint(equalToConstant: 350),
            logoApp.widthAnchor.constraint(equalToConstant: 350),
            logoApp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            loginLabel.topAnchor.constraint(equalTo: logoApp.bottomAnchor, constant: -105),
            loginLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            lineView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 100),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 64),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -64),
            lineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            bgButtonLogin.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 80),
            bgButtonLogin.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgButtonLogin.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bgButtonLogin.heightAnchor.constraint(equalToConstant: 43),
            
            loginButton.topAnchor.constraint(equalTo: bgButtonLogin.topAnchor),
            loginButton.leadingAnchor.constraint(equalTo: bgButtonLogin.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: bgButtonLogin.trailingAnchor),
            loginButton.bottomAnchor.constraint(equalTo: bgButtonLogin.bottomAnchor),
            
            bgButtonRegister.topAnchor.constraint(equalTo: bgButtonLogin.bottomAnchor, constant: 40),
            bgButtonRegister.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            bgButtonRegister.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            bgButtonRegister.heightAnchor.constraint(equalToConstant: 43),
            
            registerButton.topAnchor.constraint(equalTo: bgButtonRegister.topAnchor),
            registerButton.leadingAnchor.constraint(equalTo: bgButtonRegister.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: bgButtonRegister.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: bgButtonRegister.bottomAnchor),
            
            
        ])
    }
}

