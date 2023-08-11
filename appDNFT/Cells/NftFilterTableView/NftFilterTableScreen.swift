//
//  NftFilterTableScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 14/06/2023.
//

import UIKit

class NftFilterTableScreen: UIView {
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
        view.backgroundColor = .purple
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        return view
    }()
    
    lazy var nftImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
//        image.clipsToBounds = true
//        image.layer.cornerRadius = 18
        return image
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 24
        return image
    }()
    
    lazy var ownedByPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
//        label.textColor = UIColor(red: 69/255, green: 191/255, blue: 229/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var userLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    lazy var priceValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 1/255, alpha: 1.0)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(viewBackground)
        viewBackground.addSubview(nftImage)
        viewBackground.addSubview(userImage)
        viewBackground.addSubview(ownedByPriceLabel)
        viewBackground.addSubview(userLabel)
        viewBackground.addSubview(priceLabel)
        viewBackground.addSubview(priceValueLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            viewBackground.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: 340),
            
            nftImage.topAnchor.constraint(equalTo: viewBackground.topAnchor),
            nftImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            nftImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            nftImage.heightAnchor.constraint(equalToConstant: 270),
            
            userImage.topAnchor.constraint(equalTo: nftImage.bottomAnchor, constant: 10),
            userImage.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 8),
            userImage.heightAnchor.constraint(equalToConstant: 48),
            userImage.widthAnchor.constraint(equalToConstant: 48),
            
            ownedByPriceLabel.topAnchor.constraint(equalTo: nftImage.bottomAnchor, constant: 20),
            ownedByPriceLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            
            userLabel.topAnchor.constraint(equalTo: ownedByPriceLabel.bottomAnchor, constant: 5),
            userLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 8),
            
            priceLabel.topAnchor.constraint(equalTo: nftImage.bottomAnchor, constant: 20),
            priceLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -15),
            
            priceValueLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 5),
            priceValueLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -15)
            
        ])
    }
    
}
