//
//  NftImageTableScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 18/06/2023.
//

import UIKit

protocol NftImageTableScreenProtocol: AnyObject {
    func pressClosedButton()
    func pressGlassButton()
}

class NftImageTableScreen: UIView {
    
    private weak var delegate: NftImageTableScreenProtocol?
    
    public func delegate(delegate: NftImageTableScreenProtocol?) {
        self.delegate = delegate
    }

    lazy var nftImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.tintColor = .white
        return image
    }()
    
    lazy var closedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(pressClosedButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pressClosedButton(_ sender: UIButton) {
        delegate?.pressClosedButton()
    }
    
    lazy var glassButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(pressGlassButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pressGlassButton(_ sender: UIButton) {
        delegate?.pressGlassButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(nftImageView)
        addSubview(closedButton)
        addSubview(glassButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nftImageView.topAnchor.constraint(equalTo: topAnchor),
            nftImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            closedButton.topAnchor.constraint(equalTo: nftImageView.topAnchor, constant: 30),
            closedButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            closedButton.heightAnchor.constraint(equalToConstant: 35),
            closedButton.widthAnchor.constraint(equalToConstant: 35),
            
            glassButton.bottomAnchor.constraint(equalTo: nftImageView.bottomAnchor, constant: -30),
            glassButton.trailingAnchor.constraint(equalTo: nftImageView.trailingAnchor, constant: -20),
            glassButton.heightAnchor.constraint(equalToConstant: 35),
            glassButton.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
    
}
