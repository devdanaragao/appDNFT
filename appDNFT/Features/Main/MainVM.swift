//
//  MainVM.swift
//  appDNFT
//
//  Created by Danilo Santos on 12/06/2023.
//

import UIKit

protocol MainVMDelegate: AnyObject {
    func sucess()
    func error()
}

class MainVM {

    private let service: MainService = MainService()
    private var nftData: NFTData?
    private var searchNftData: NFTData?
    private weak var delegate: MainVMDelegate?
    
    public func delegate(delegate: MainVMDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchRequest(_ typeFetch: TypeFetch) {
        switch typeFetch {
        case .mock:
            service.getMainFromJson { result, failure in
                if let result {
                    print("sucess")
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.sucess()
                } else {
                    //MARK: Erro amarelo, foi preciso adicionar o " as Any "
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        case .request:
            service.getMain { result, failure in
                if let result {
                    print("sucess")
                    self.nftData = result
                    self.searchNftData = result
                    self.delegate?.sucess()
                } else {
                    print(failure as Any)
                    self.delegate?.error()
                }
            }
        }
        
    }
    
    //MARK: Filter CollectionView
    
    public var numberOfItemsInSection: Int {
        return searchNftData?.filterListNft?.count ?? 0
    }
    
    public func loadCurrentFilterNft(indexPath: IndexPath) -> FilterNft {
        return searchNftData?.filterListNft?[indexPath.row] ?? FilterNft()
    }
    
    public var sizeForItemAt: CGSize {
        return CGSize(width: 100, height: 34)
    }
    
    public func setFilter(indexPath: IndexPath, searchText: String) {
        var filterNFT: [FilterNft] = []
        for (index, value) in (searchNftData?.filterListNft ?? []).enumerated() {
            var type = value
            if index == indexPath.row {
                type.isSelected = true
            } else {
                type.isSelected = false
            }
            filterNFT.append(type)
        }
        searchNftData?.filterListNft = filterNFT
        filterSearchText(searchText)
    }
    
    //MARK: NftTableViewCell
    
    public var numberOfRowsInSection: Int {
        return searchNftData?.nftList?.count ?? 0
    }
    
    public func loadCurrentNft(indexPath: IndexPath) -> Nft {
        return searchNftData?.nftList?[indexPath.row] ?? Nft()
    }
    
    public var heightForRowAt: CGFloat {
        return 360
    }
    
    //MARK: -  Filter
    
    var typeFilter: Int? {
        return searchNftData?.filterListNft?.first(where: {$0.isSelected == true})?.id
    }
    
    public func filterSearchText(_ text: String) {
        
        var nftList: [Nft] = []
        
        if typeFilter == 0 /* 0 = Todos */ {
            nftList = nftData?.nftList ?? []
        } else {
            nftList = nftData?.nftList?.filter({$0.type == typeFilter ?? 0}) ?? []
        }
        
        //MARK: - Lowercased = caso o usuario coloque Caixa Alta ou não, verificar do mesmo modo.
        if text.isEmpty {
            searchNftData?.nftList = nftList
        } else {
            searchNftData?.nftList = nftList.filter({ nft in
                return nft.userName?.lowercased().contains(text.lowercased()) ?? false
            })
        }
    }
    
}
