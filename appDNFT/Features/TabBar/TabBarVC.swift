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
        setViewControllers([main], animated: false)
        tabBar.isTranslucent = false
        tabBar.tintColor = .green
//        tabBar.backgroundColor = .systemGray
        
        guard let items = tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "person")
    }

}
