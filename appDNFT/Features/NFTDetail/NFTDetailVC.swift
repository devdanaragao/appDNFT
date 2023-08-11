//
//  NFTDetailVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 18/06/2023.
//

import UIKit

enum NameCellNftDetail: Int {
    case nftImage = 0
    case description = 1
    case LatestDeal = 2
}

class NFTDetailVC: UIViewController {
    
    private var screen: NFTDetailScreen?
    private let viewModel: NFTDetailVM
    
    override func loadView() {
        screen = NFTDetailScreen()
        view = screen
    }
    
    required init(nft: Nft) {
        viewModel = NFTDetailVM(nft: nft)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.configTableViewProtocols(delegate: self, dataSource: self)
    }

}

extension NFTDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case .nftImage:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftImageTableViewCell.identifier, for: indexPath) as? NftImageTableViewCell
            cell?.setupCell(urlImage: viewModel.nftImage, delegate: self)
            return cell ?? UITableViewCell()
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: NftDescriptionTableViewCell.identifier, for: indexPath) as? NftDescriptionTableViewCell
            cell?.setupCell(id: viewModel.idNft, title: viewModel.titleNft, description: viewModel.descriptionNft)
            return cell ?? UITableViewCell()
            
        case .LatestDeal:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestDealTableViewCell.identifier, for: indexPath) as?
                LatestDealTableViewCell
            cell?.setupCell(data: viewModel.getNft)
            return cell ?? UITableViewCell()
            
        default:
            return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath, width: view.frame.width)
    }
}

extension NFTDetailVC: NftImageTableScreenProtocol {
    func pressClosedButton() {
        dismiss(animated: true)
    }
    
    func pressGlassButton() {
        present(ImageGlassVC(urlImage: viewModel.nftImage), animated: true)
    }
    
    
}
