//
//  WalletVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 21/06/2023.
//

import UIKit

enum WalletNameCell: Int {
    case quotationEuro = 0
    case transactionList = 1
}

class WalletVC: UIViewController {
    
    private var screen: WalletScreen?
    
    var viewModel: WalletVM = WalletVM()
    
    override func loadView() {
        screen = WalletScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate(delegate: self)
        viewModel.fetch(.request)
        
    }

}

extension WalletVC: WalletVMProtocol {
    func Sucess() {
        DispatchQueue.main.async {
            self.screen?.configTableViewProtocols(delegate: self, dataSource: self)
            self.screen?.tableView.reloadData()
        }
    }
    
    func Error() {
        
    }
    
}

extension WalletVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch WalletNameCell(rawValue: indexPath.row) {
        case .quotationEuro:
            let cell = tableView.dequeueReusableCell(withIdentifier: WalletQuotationTableViewCell.identifier, for: indexPath) as? WalletQuotationTableViewCell
            cell?.setupCell(data: viewModel.quotationEthereum)
            return cell ?? UITableViewCell()
            
        case .transactionList:
            let cell = tableView.dequeueReusableCell(withIdentifier: LatestTransactionTableViewCell.identifier, for: indexPath) as? LatestTransactionTableViewCell
            cell?.setupCell(data: viewModel.latestTransactionsCell)
            return cell ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.heightForRowAt(indexPath: indexPath)
    }
    
    
}
