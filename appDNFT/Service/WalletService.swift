//
//  WalletService.swift
//  appDNFT
//
//  Created by Danilo Santos on 21/06/2023.
//

import UIKit
import Alamofire

protocol WalletServiceDelegate: GenericService {
    func getWalletFromJson(completion: @escaping completion<WalletData?>)
    func getWallet(completion: @escaping completion<WalletData?>)
}


class WalletService: WalletServiceDelegate {
    
    func getWallet(completion: @escaping completion<WalletData?>) {
        let url: String = "https://run.mocky.io/v3/d1823d68-3355-4d53-8800-2a847b0af2e1"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: WalletData.self) { response in
            debugPrint(response)
            
            switch response.result {
                
            case .success(let sucess):
                print("Sucess -> \(#function)")
                completion(sucess, nil)
            case .failure(let error):
                print("Error -> \(#function)")
                completion(nil, Error.errorRequest(error))
            }
        }
    }
    
    func getWalletFromJson(completion: @escaping completion<WalletData?>) {
        if let url = Bundle.main.url(forResource: "WalletData", withExtension: "json") {
           do {
               let data = try Data(contentsOf: url)
               let walletData: WalletData = try JSONDecoder().decode(WalletData.self, from: data)
               completion(walletData,nil)
           } catch {
               completion(nil, Error.fileDecodingFailed(name: "WalletData", error))
           }
        } else {
            completion(nil, Error.fileNotFound(name: "WalletData"))
        }
    }
    

}

