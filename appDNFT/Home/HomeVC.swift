//
//  HomeVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 08/06/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    var homeScreen: HomeScreen?

    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.delegate(delegate: self)
    }

}


extension HomeVC: HomeScreenProtocol {
    func pressLoginButton() {
        let vc: LoginVC = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func pressRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    
}
