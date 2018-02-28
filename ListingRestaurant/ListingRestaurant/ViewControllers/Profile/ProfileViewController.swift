//
//  ViewController.swift
//  ListingRestaurant
//
//  Created by Tran Hoang Canh on 27/2/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit
import RxSwift
import CT_RESTAPI

class ProfileViewController: BaseMainViewController {
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func logOutButtonTapped(_ sender: Any) {
        
        // Clear fake token
        Helper.saveFakeToken(tokenString: "")
        
        appDelegate.switchRootViewController(LoginViewController.instantiateFromStoryboard(StoryBoardName.login), animated: true, completion: nil)
    }
    
}

