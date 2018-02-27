//
//  ValidateService.swift
//  GameOn
//
//  Created by thcanh on 1/12/17.
//  Copyright © 2017 CanhTran. All rights reserved.
//

import Foundation
#if !RX_NO_MODULE
    import RxSwift
#endif


class DefaultValidationService: ValidationService {
    
    static let sharedValidationService = DefaultValidationService()
    
    
    // validation
    
    let minPasswordCount = 5
    
    func validateEmail(_ email: String) -> ValidationResult {
        if !email.isEmail() {
            return .failed(message: "Please enter correct email format")
        }
        else if !email.contains("@babson.edu") && !email.contains("@gmail.com") {
            return .failed(message: "This email is not supported by our system")
        }
        return .ok
    }
    
    
    func validateEmpty(_ fname: String) -> ValidationResult {
        if fname.count == 0 {
            return .empty(message: "This field can be empty")
        } else {
            return .ok
        }
    }
    
    func validatePassword(_ password: String) -> ValidationResult {
        let numberOfCharacters = password.count
        if numberOfCharacters == 0 {
            return .empty(message: "This field can be empty")
        }
        
        return .ok
    }
    
}
