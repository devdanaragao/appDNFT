//
//  WalletVM.swift
//  appDNFT
//
//  Created by Danilo Santos on 21/06/2023.
//

import UIKit

protocol WalletVMProtocol: AnyObject {
    func Sucess()
    func Error()
}

class WalletVM {
    
    private let service: WalletService = WalletService()
    
    private weak var delegate: WalletVMProtocol?
    
    private var walletData: WalletData?
    
    public func delegate(delegate: WalletVMProtocol?) {
        self.delegate = delegate
    }
    
    public func fetch(_ type: TypeFetch) {
        switch type {
            
        case .mock:
            service.getWalletFromJson { result, failure in
                if let result {
                    self.walletData = result
                    self.delegate?.Sucess()
                } else {
                    self.delegate?.Error()
                }
            }
        case .request:
            service.getWallet { result, failure in
                if let result {
                    self.walletData = result
                    self.delegate?.Sucess()
                } else {
                    self.delegate?.Error()
                }
            }
        }
    }
    
    var numberOfRowsInSection: Int {
        return 2
    }
    
    public func heightForRowAt(indexPath: IndexPath) -> CGFloat {
        switch WalletNameCell(rawValue: indexPath.row) {
            
        case .quotationEuro:
            return 250
        case .transactionList:
            return heightLatestTransaction.height.rawValue * CGFloat(walletData?.latestTransactionsCell?.listOfTransactions?.count ?? 0) + 75
        default:
            return 0
        }
    }
    
    public var quotationEthereum: QuotationEthereum {
        return walletData?.quotationEthereum ?? QuotationEthereum()
    }
    
    public var latestTransactionsCell: LatestTransactionsCell {
        return walletData?.latestTransactionsCell ?? LatestTransactionsCell()
    }

}
