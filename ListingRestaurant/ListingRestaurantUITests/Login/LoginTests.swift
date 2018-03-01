//
//  LoginTests.swift
//  ListingRestaurantUITests
//
//  Created by Canh Tran on 3/1/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import XCTest

class LoginTests: BaseUITest {
    
    // MARK: Login keys
    let emailTextFieldID    = "loginEmailTextField"
    let errorEmailLabel     = "errorEmailLabel"
    let passwordTextFieldID = "loginPasswordTextField"
    let errorPasswordLabel  = "errorPasswordLabel"
    let loginButton         = "loginSignInButton"
    
    override func setUp() {
        super.setUp()
        checkIsLoggedAlreadyOrNot()
    }
    
    override func tearDown() {
        
        super.tearDown()
    }
    
    private func checkIsLoggedAlreadyOrNot() {
        let tabbarProfile = app.tabBars.buttons["Profile"]
        if tabbarProfile.exists {
            // Login already
            tabbarProfile.tap()
            
            // Tap to logout
            let logoutButton = app.buttons["profileLogOutButton"]
            waitUntilElementExists(logoutButton)
            logoutButton.tap()
            
            waitUntilElementNonExists(tabbarProfile)
        }
    }
    
    func inputSignIn(email: String, password: String) {
        inputTextToTextField(app.textFields[self.emailTextFieldID], text: email)
        inputTextToTextField(app.secureTextFields[self.passwordTextFieldID], text: password)
        
        let loginButtonTapped = app.buttons[self.loginButton]
        loginButtonTapped.tap()
    }
    
}
