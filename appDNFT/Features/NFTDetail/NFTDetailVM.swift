//
//  NFTDetailVM.swift
//  appDNFT
//
//  Created by Danilo Santos on 18/06/2023.
//

import UIKit

class NFTDetailVM {

    private let nft: Nft

    init(nft: Nft) {
        self.nft = nft
    }
    
    public var numberOfRowsInSection: Int {
        return 3
    }
    
    public var nftImage: String {
        return nft.nftImage ?? ""
    }
    
    public var idNft: Int {
        return nft.nftID ?? 0
    }
    
    public var titleNft: String {
        return nft.nftNameImage ?? ""
    }
    
    public var descriptionNft: String {
        return nft.nftDescription ?? ""
    }
    
    public var getNft: Nft {
        return nft
    }
    
    public func heightForRowAt(indexPath: IndexPath, width: CGFloat) -> CGFloat {
        switch NameCellNftDetail(rawValue: indexPath.row) {
            
        case .nftImage:
            return 400
            
        case .description:
            return descriptionNft.height(withConstrainedWidth: width - 40, font: UIFont.systemFont(ofSize: 18)) + 89
            
        case .LatestDeal:
            //MARK: 75 = Somatoria da table view e label ultimas ofertas e table view ao final.
            return heightLatestDeal.height.rawValue * CGFloat(nft.latestDeals?.count ?? 0) + 75
            
        default:
            return 0
        }
    }
    
}
