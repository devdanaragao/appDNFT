//
//  String+Extension.swift
//  appDNFT
//
//  Created by Danilo Santos on 11/06/2023.
//

import Foundation
import UIKit

public enum ValidType {
    case email
    case password
    case name
}

extension String {
    
    enum Regex: String {
        case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        case password = ".{6,}"
        case name = "[A-Za-z]+"
    }
    
    func isValid(validType: ValidType) -> Bool {
        let format = "SELF MATCHES %@"
        var regex = ""
        
        switch validType {
        case .email:
            regex = Regex.email.rawValue
        case .password:
            regex = Regex.password.rawValue
        case .name:
            regex = Regex.name.rawValue
        }
        return NSPredicate(format:format, regex).evaluate(with: self)
    }
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
            let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
            
            return ceil(boundingBox.height)
        }
        
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
            let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
            let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
            
            return ceil(boundingBox.width)
        }

}
