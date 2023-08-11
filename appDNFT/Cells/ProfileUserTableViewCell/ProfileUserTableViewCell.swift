//
//  ProfileUserTableViewCell.swift
//  appDNFT
//
//  Created by Danilo Santos on 05/07/2023.
//

import UIKit

class ProfileUserTableViewCell: UITableViewCell {

    static let identifier: String = String(describing: ProfileUserTableViewCell.self)
    
    private lazy var screen: ProfileUserTableScreen = {
        let view = ProfileUserTableScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addViews()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addViews() {
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
    
    public func setupCell(delegate: ProfileUserTableScreenProtocol) {
        screen.delegate(delegate: delegate)
    }

}
