//
//  ImageGlassScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 21/06/2023.
//

import UIKit

protocol ImageGlassScreenProtocol: AnyObject {
    func pressBackButton()
}

class ImageGlassScreen: UIView {
    
    private weak var delegate: ImageGlassScreenProtocol?
    
    public func delegate(delegate: ImageGlassScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var nftImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .purple
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.tintColor = .white
        button.setImage(UIImage(systemName: "arrowshape.turn.up.backward.fill"), for: .normal)
        button.addTarget(self, action: #selector(pressBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc func pressBackButton(_ sender: UIButton) {
        delegate?.pressBackButton()
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
        addSubview(nftImage)
        addSubview(backButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            nftImage.topAnchor.constraint(equalTo: topAnchor),
            nftImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 35),
            backButton.widthAnchor.constraint(equalToConstant: 35),
        ])
    }
    
}
