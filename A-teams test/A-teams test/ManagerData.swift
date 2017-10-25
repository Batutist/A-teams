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
        
        let postsUrl = "https://jsonplaceholder.typicode.com/posts"
        let commentsUrl = "https://jsonplaceholder.typicode.com/comments"
        let usersUrl = "https://jsonplaceholder.typicode.com/users"
        let photosUrl = "https://jsonplaceholder.typicode.com/photos"
        let toDosUrl = "https://jsonplaceholder.typicode.com/todos"
        
        let urlArray = [postsUrl, commentsUrl, usersUrl, photosUrl, toDosUrl]
        
        
        
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let id = subJson["id"].intValue
                            let toDoTitle = subJson["title"].stringValue
                            let completed = subJson["completed"].boolValue
                        }
            case .failure(let error):
                print(error)
            }
        }
    }
}
