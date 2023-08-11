//
//  NftFilterCollectionViewCell.swift
//  appDNFT
//
//  Created by Danilo Santos on 13/06/2023.
//

import UIKit

class NftFilterCollectionViewCell: UICollectionViewCell {
    
    //MARK: A mesma coisa, a abordagem diferente é apenas para não acontecer string mágica e automaticamente ele avisar, caso faça alteracao na Class que possui um erro e tem que ser feita a alteração.
//    static let identifier: String = "NftFilterCollectionViewCell"
    static let identifier: String = String(describing: NftFilterCollectionViewCell.self)
    
    private lazy var screen: NftFilterScreen = {
        let view = NftFilterScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    
    public func setupCell(filter: FilterNft) {
        screen.filterLabel.text = filter.title ?? ""
        if filter.isSelected ?? false {
            screen.filterLabel.backgroundColor = .systemGreen
        } else {
            screen.filterLabel.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1)
        }
    }
    
}
