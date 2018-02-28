//
//  RestaurantViewController.swift
//  ListingRestaurant
//
//  Created by Canh Tran on 2/27/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit
import AMScrollingNavbar

class RestaurantViewController: BaseMainViewController {

    @IBOutlet weak var restaurantsTableView: UITableView!
    
    fileprivate lazy var loadingView: LoaddingView = {
        let loadingView = LoaddingView(frame: UIScreen.main.bounds)
        loadingView.backgroundColor = .clear
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(loadingView)
        return loadingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.followScrollView(restaurantsTableView, delay: 50.0)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let navigationController = navigationController as? ScrollingNavigationController {
            navigationController.stopFollowingScrollView()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 

}
