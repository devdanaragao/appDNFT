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
        let profile = UINavigationController(rootViewController: ProfileVC())
        setViewControllers([main, wallet, profile], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = .green
//        tabBar.backgroundColor = UIColor(red: 140/255, green: 12/255, blue: 216/255, alpha: 1)
//        tabBar.backgroundColor = .white
        
        let tabBarAppearance: UITabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithDefaultBackground()
        tabBarAppearance.backgroundColor = .purple
//        UITabBar.appearance().standardAppearance = tabBarAppearance
//        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "case.fill")
        items[1].image = UIImage(systemName: "wallet.pass.fill")
        items[2].image = UIImage(systemName: "person.fill")
    }

}
