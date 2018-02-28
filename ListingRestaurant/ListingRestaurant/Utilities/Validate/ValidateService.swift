//
//  ValidateService.swift
//  GameOn
//
//  Created by thcanh on 1/12/17.
//  Copyright © 2017 CanhTran. All rights reserved.
//

import Foundation
import RxSwift

class DefaultValidationService: ValidationService {
    
    static let sharedValidationService = DefaultValidationService()
    
    // validation
    
    let minPasswordCount = 5
    
    func validateEmail(_ email: String) -> ValidationResult {
        if !email.isEmail() {
            return .failed(message: "Please enter correct email format")
        }
        return .ok
    }
    
    
    func validatePassword(_ password: String) -> ValidationResult {
        let numberOfCharacters = password.count
        if numberOfCharacters == 0 {
            return .failed(message: "This field can be empty")
        }
        
        return .ok
    }
    
}
