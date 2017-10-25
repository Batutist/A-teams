//
//  ManagerData.swift
//  A-teams test
//
//  Created by Ковалева on 24.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ManagerData {
    
    func loadJSON() {
        
        let url = "https://jsonplaceholder.typicode.com/posts"
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
            case .failure(let error):
                print(error)
            }
        }
    }
}
