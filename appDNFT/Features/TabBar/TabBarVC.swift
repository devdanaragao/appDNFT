//
//  TabBarVC.swift
//  appDNFT
//
//  Created by Danilo Santos on 11/06/2023.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        let main = UINavigationController(rootViewController: MainVC())
        let wallet = UINavigationController(rootViewController: WalletVC())
        setViewControllers([main,wallet], animated: false)
        tabBar.isTranslucent = true
        tabBar.tintColor = .green
//        tabBar.backgroundColor = UIColor(red: 140/255, green: 12/255, blue: 216/255, alpha: 1)
        tabBar.backgroundColor = .purple
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "person")
        items[1].image = UIImage(systemName: "wallet.pass")
    }

}
