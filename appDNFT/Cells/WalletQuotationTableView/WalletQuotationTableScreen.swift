//
//  WalletQuotationTableScreen.swift
//  appDNFT
//
//  Created by Danilo Santos on 22/06/2023.
//

import UIKit

class WalletQuotationTableScreen: UIView {
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 58/255, green: 52/255, blue: 57/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1.5
        view.layer.borderColor = UIColor(red: 131/255, green: 127/255, blue: 131/255, alpha: 1.0).cgColor
        return view
    }()
    
    lazy var euroValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var euroValueInDollarsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    lazy var coinEuroImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(systemName: "eurosign")
        image.tintColor = .green
        return image
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
        viewBackground.addSubview(euroValueLabel)
        viewBackground.addSubview(euroValueInDollarsLabel)
        addSubview(coinEuroImageView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            viewBackground.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            viewBackground.heightAnchor.constraint(equalToConstant: 150),
            
            euroValueLabel.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 50),
            euroValueLabel.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 15),
            
            euroValueInDollarsLabel.topAnchor.constraint(equalTo: euroValueLabel.bottomAnchor, constant: 10),
            euroValueInDollarsLabel.leadingAnchor.constraint(equalTo: euroValueLabel.leadingAnchor),
            
            coinEuroImageView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            coinEuroImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            coinEuroImageView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
}
