//
//  LoginFailedTests.swift
//  ListingRestaurantUITests
//
//  Created by Tran Hoang Canh on 1/3/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import XCTest

extension LoginTests {
    
    func testLoginInvalidEmail() {
        inputSignIn(email: "hoangcanhs@@gmail.com", password: "abc123")
        
        let errorMessageEmail = app.staticTexts["Please enter correct email format"]
        waitUntilElementExists(errorMessageEmail)
        XCTAssert(errorMessageEmail.exists)
        
        sleep(2) // To see the error more clearly
    }
    
    func testLoginInvalidPassword() {
        
        inputSignIn(email: "takehome@2359media.com", password: "abc123!1")

        let errorErrorPassword = app.staticTexts["Your password is not well formed"]
        waitUntilElementExists(errorErrorPassword)
        XCTAssert(errorErrorPassword.exists)
        
        sleep(2)
    }
    
    func testLoginEmailNotExists() {
        inputSignIn(email: "takehome11@2359media.com", password: "1Faraday@")
        
        let errorErrorEmail = app.staticTexts["Email does not exist"]
        waitUntilElementExists(errorErrorEmail)
        XCTAssert(errorErrorEmail.exists)
        
        sleep(2)
    }
    
    func testLoginPasswordDoesNotMatch() {
        inputSignIn(email: "takehome@2359media.com", password: "aAbc123!@#")
        
        let errorErrorEmail = app.staticTexts["Password does not match"]
        waitUntilElementExists(errorErrorEmail)
        XCTAssert(errorErrorEmail.exists)
        
        sleep(2)
    }
}
