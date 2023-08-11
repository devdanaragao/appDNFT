//
//  WalletQuotationTableViewCell.swift
//  appDNFT
//
//  Created by Danilo Santos on 22/06/2023.
//

import UIKit

class WalletQuotationTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: WalletQuotationTableViewCell.self)
    
    private lazy var screen: WalletQuotationTableScreen = {
        let view = WalletQuotationTableScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        contentView.addSubview(screen)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            screen.topAnchor.constraint(equalTo: topAnchor),
            screen.leadingAnchor.constraint(equalTo: leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    public func setupCell(data: QuotationEthereum) {
        screen.euroValueLabel.text = "\(data.ethValue ?? 0) EURO"
        screen.euroValueInDollarsLabel.text = "$ \(data.valueInDollars ?? 0)"
        screen.coinEuroImageView.image = UIImage(systemName: "eurosign")
    }

}
