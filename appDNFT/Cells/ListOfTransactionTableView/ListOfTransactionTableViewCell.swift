//
//  ListOfTransactionTableViewCell.swift
//  appDNFT
//
//  Created by Danilo Santos on 23/06/2023.
//

import UIKit

class ListOfTransactionTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: ListOfTransactionTableViewCell.self)
    
    private lazy var screen: ListOfTransactionTableScreen = {
        let view = ListOfTransactionTableScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
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
    
    public func setupCell(data: ListOfTransaction, isInicial: Bool, isFinal: Bool) {
        
        screen.idTransactionLabel.text = data.idTransaction ?? ""
        screen.transactionImageView.image = UIImage(named: data.image ?? "")
        screen.valueInDollarLabel.text = "$ \(data.valueDollar ?? 0)"
        screen.dateEndHourLabel.text = data.dateAndHour ?? ""
        
        if data.type == "exit" {
            screen.priceEuroLabel.text = "-\(data.priceEth ?? 0) EURO"
            screen.priceEuroLabel.textColor = UIColor(red: 183/255, green: 0/255, blue: 170/255, alpha: 1)
            screen.valueInDollarLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
            screen.dateEndHourLabel.textColor = UIColor(red: 255/255, green: 152/255, blue: 255/255, alpha: 1)
        } else {
            screen.priceEuroLabel.text = "+\(data.priceEth ?? 0) EURO"
            screen.priceEuroLabel.textColor = .green
            screen.valueInDollarLabel.textColor = .systemGreen
            screen.dateEndHourLabel.textColor = .systemGreen
        }
        
        screen.layer.borderColor = UIColor.white.cgColor
        screen.layer.borderWidth = 0.5
        
        if isInicial {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.topLeft, .topRight])
        }
        
        if isFinal {
            screen.roundCorners(cornerRadiuns: 20, typeCorners: [.bottomLeft, .bottomRight])
        }
    }
    
}
