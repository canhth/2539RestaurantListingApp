//
//  UITextField+Extension.swift
//  ListingRestaurant
//
//  Created by Canh Tran on 2/27/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit

extension UITextField {
     
    
    @IBInspectable var localizeKey: String {
        
        get {
            return ""
        } set {
            self.text = NSLocalizedString(newValue, comment: "")
        }
    }
    
    @IBInspectable var placeholderLocalizeKey: String {
        
        get {
            return ""
        } set {
            self.placeholder = NSLocalizedString(newValue, comment: "")
        }
    }
}
