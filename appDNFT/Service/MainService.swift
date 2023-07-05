//
//  MainService.swift
//  appDNFT
//
//  Created by Danilo Santos on 12/06/2023.
//

import UIKit
import Alamofire

protocol MainServiceDelegate: GenericService {
    func getMainFromJson(completion: @escaping completion<NFTData?>)
    func getMain(completion: @escaping completion<NFTData?>)
}


class MainService: MainServiceDelegate {
    
    func getMain(completion: @escaping completion<NFTData?>) {
        let url: String = "https://run.mocky.io/v3/dcc7071c-d1b7-471f-bb63-1790642aad50"
        
        AF.request(url, method: .get).validate(statusCode: 200...299).responseDecodable(of: NFTData.self) { response in
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
    
    func getMainFromJson(completion: @escaping completion<NFTData?>) {
        if let url = Bundle.main.url(forResource: "HomeData", withExtension: "json") {
           do {
               let data = try Data(contentsOf: url)
               let nftData: NFTData = try JSONDecoder().decode(NFTData.self, from: data)
               completion(nftData,nil)
           } catch {
               completion(nil, Error.fileDecodingFailed(name: "HomeData", error))
           }
        } else {
            completion(nil, Error.fileNotFound(name: "HomeData"))
        }
    }
    

}
