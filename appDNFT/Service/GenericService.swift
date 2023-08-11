//
//  GenericService.swift
//  appDNFT
//
//  Created by Danilo Santos on 12/06/2023.
//

import Foundation
import Alamofire

enum Error: Swift.Error {
    case fileNotFound(name: String)
    case fileDecodingFailed(name: String, Swift.Error)
    case errorRequest(AFError)
}

// Dessa forma posso usar o enum em qualquer tela.
enum TypeFetch {
    case mock
    case request 
}

protocol GenericService: AnyObject {
    typealias completion <T> = (_ result: T, _ failure: Error?) -> Void
}
