//
//  LoginSuccessTests.swift
//  ListingRestaurantUITests
//
//  Created by Tran Hoang Canh on 1/3/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import XCTest

extension LoginTests {
    
    func testLoginSuccess() {
        inputSignIn(email: "takehome@2359media.com", password: "1Faraday@")
        
        let loginButton = app.buttons[self.loginButton]
        waitUntilElementNonExists(loginButton)
        XCTAssert(!loginButton.exists)
    }
    
}
