//
//  ProfileUserTableScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 05/07/2023.
//

import UIKit

protocol ProfileUserTableScreenProtocol: AnyObject {
    func pressClosedButton()
}

class ProfileUserTableScreen: UIView {
    
    private weak var delegate: ProfileUserTableScreenProtocol?
    
    public func delegate(delegate: ProfileUserTableScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var userImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "user")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 65
        image.layer.borderColor = UIColor.green.cgColor
        image.layer.borderWidth = 2
        return image
    }()
    
    lazy var editImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "pencil")
        image.contentMode = .scaleAspectFill
        image.tintColor = .green
        return image
    }()
    
    lazy var closedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.setTitle("Sair do Aplicativo", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(red: 207/255, green: 0/255, blue: 192/255, alpha: 1), for: .normal)
        button.layer.borderWidth = 1.7
        button.layer.borderColor = UIColor(red: 53/255, green: 255/255, blue: 33/255, alpha: 1).cgColor
        button.addTarget(self, action: #selector(pressClosedButton), for: .touchUpInside)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.text = "Danilo Aragão"
        label.textAlignment = .right
        return label
    }()
    
    lazy var profileLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "@danaragao"
        label.textAlignment = .right
        return label
    }()
    
    @objc func pressClosedButton(_ sender: UIButton) {
        print(#function)
        delegate?.pressClosedButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1)
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
        addSubview(userImageView)
        addSubview(editImageView)
        addSubview(closedButton)
        addSubview(nameLabel)
        addSubview(profileLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            userImageView.heightAnchor.constraint(equalToConstant: 130),
            userImageView.widthAnchor.constraint(equalToConstant: 130),
            
            editImageView.bottomAnchor.constraint(equalTo: userImageView.bottomAnchor),
            editImageView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: -25),
            editImageView.heightAnchor.constraint(equalToConstant: 25),
            editImageView.widthAnchor.constraint(equalToConstant: 25),
            
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            profileLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            profileLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            closedButton.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: 60),
            closedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            closedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            closedButton.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
}
