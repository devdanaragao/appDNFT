//
//  NftFilterTableVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 14/06/2023.
//

import UIKit
import AlamofireImage

class NftFilterTableViewCell: UITableViewCell {
    
    static let identifier: String = String(describing: NftFilterTableViewCell.self)
    
    private lazy var screen: NftFilterTableScreen = {
        let view = NftFilterTableScreen()
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
    
    public func setupCell(data: Nft) {
        if let urlNFT: URL = URL(string: data.nftImage ?? ""), let urlUser: URL = URL(string: data.userImage ?? "") {
            //MARK: " AF " = Alamofire, " PlaceHolderImage " = Prévia da imagem
            screen.nftImage.af.setImage(withURL: urlNFT, placeholderImage: UIImage(named: "threeButtons"))
            //MARK: "Essa função deixa a cor de fundo branco, enquanto a imagem não carrega "
            screen.nftImage.backgroundColor = .white
            
            //MARK: "withTintColor " = Como é imagem do sistema, cor black.
            screen.userImage.af.setImage(withURL: urlUser, placeholderImage: UIImage(systemName: "person.circle.fill")?.withTintColor(.black))
            //MARK: "Essa função deixa a cor de fundo branco, enquanto a imagem não carrega "
            screen.userImage.backgroundColor = .white
        }
        screen.priceLabel.text = data.price ?? ""
        screen.priceValueLabel.text = "\(data.nftPrice ?? 0.0) EURO"
        screen.ownedByPriceLabel.text = data.ownedBy
        screen.userLabel.text = data.userName
    }
    

}
