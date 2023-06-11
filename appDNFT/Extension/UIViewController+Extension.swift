//
//  UIViewController+Extension.swift
//  appDNFT
//
//  Created by Danilo Santos on 11/06/2023.
//

import Foundation
import UIKit

extension UIViewController {
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
}
