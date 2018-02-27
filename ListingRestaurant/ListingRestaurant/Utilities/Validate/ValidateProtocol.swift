//
//  ValidateProtocol.swift
//  GameOn
//
//  Created by thcanh on 1/12/17.
//  Copyright © 2017 CanhTran. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

enum ValidationResult {
    case ok
    case empty(message: String)
    case validating
    case failed(message: String)
}

enum SignupState {
    case signedUp(signedUp: Bool)
}

protocol ValidationService {
    func validateEmpty(_ fname: String) -> ValidationResult
    func validateEmail(_ email: String) -> ValidationResult
    func validatePassword(_ password: String) -> ValidationResult
}

extension ValidationResult {
    var isValid: Bool {
        switch self {
        case .ok:
            return true
        default:
            return false
        }
    }
}
