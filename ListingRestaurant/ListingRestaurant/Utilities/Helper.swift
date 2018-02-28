//
//  Helper.swift
//  ListingRestaurant
//
//  Created by Canh Tran on 2/27/18.
//  Copyright © 2018 Tran Hoang Canh. All rights reserved.
//

import UIKit

class Helper {
    
    static func getDataFromJSONFile(fileName: String, key: String) -> [Any] {
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let restaurants = jsonResult[key] as? [Any] {
                    return restaurants
                }
            } catch {
                // handle error here
            }
        }
        return []
    }
}
