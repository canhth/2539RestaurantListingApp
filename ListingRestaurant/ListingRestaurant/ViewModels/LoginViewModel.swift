//
//  LoginViewModel.swift
//  ListingRestaurant
//
//  Created by Tran Hoang Canh on 28/2/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewModel {

    let disposeBag = DisposeBag()
    private let validationService = DefaultValidationService.sharedValidationService
    
    fileprivate(set) var emailText = Variable<String>("")
    fileprivate(set) var passwordText = Variable<String>("")
    fileprivate(set) var isEnableNextButton: Observable<Bool>!
    fileprivate(set) var validatedEmail = BehaviorSubject<ValidationResult>(value: .ok)
    fileprivate(set) var validatedPassword = BehaviorSubject<ValidationResult>(value: .ok)
    fileprivate(set) var isLoginSuccess = BehaviorSubject<Bool>(value: false)
    private var loginButtonTapped = false
    
    func setupLoginViewModel(loginButtonTap: Observable<Void>) {
        let dataFlatmap = Observable.combineLatest(emailText.asObservable(), passwordText.asObservable()) { ($0, $1) }
        
        // To disable/enable login button
        isEnableNextButton = dataFlatmap.flatMapLatest { [weak self] (email, password) -> Observable<Bool> in
            guard let strongSelf = self else { return Observable.just(false) }
            
            let enable = !email.isEmpty && !password.isEmpty
            
            if strongSelf.loginButtonTapped {
                // Validate here and only after login button tapped in the first time
                strongSelf.validatedEmail.onNext(strongSelf.validationService.validateEmail(email))
                strongSelf.validatedPassword.onNext(strongSelf.validationService.validatePassword(password))
            }
            
            return Observable.just(enable)
        }
        
        // Login button tap action
        loginButtonTap.withLatestFrom(dataFlatmap).flatMapLatest { [weak self] (email, password) -> Observable<Bool> in
            guard let strongSelf = self else { return Observable.just(false) }
            strongSelf.loginButtonTapped = true
            
            // Validate email & password again
            let validationEmail = strongSelf.validationService.validateEmail(email)
            let validationPassword = strongSelf.validationService.validatePassword(password)
            
            let isPassedValidation = (validationEmail.isValid && validationPassword.isValid)
            if isPassedValidation {
                strongSelf.isLoginSuccess.onNext(true)
                // Call API login here
                
            } else {
                // Throw error here
                strongSelf.validatedEmail.onNext(validationEmail)
                strongSelf.validatedPassword.onNext(validationPassword)
            }
            return Observable.just(isPassedValidation)
            }.subscribe(onNext: { (isValidated) in
                print("Login is validated \(isValidated)")
            }).disposed(by: disposeBag)
    }
    
}
