//
//  String+Extension.swift
//  ListingRestaurant
//
//  Created by Canh Tran on 2/27/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import Foundation


extension String {
    
    
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
   
    /**
     Check the string is the email
     
     :returns: ?true:flase
     */
    func isEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }
    
    /// Get localized string
    var localized: String! {
        let localizedString = NSLocalizedString(self, comment: "")
        if self == localizedString {
            print("CANNOT FIND TRANSLATION FOR STRING \(self)")
        }
        return localizedString
    }
}
