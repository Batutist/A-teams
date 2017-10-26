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
        
        for url in urlArray {
            let url = url
            //запрос JSON
            Alamofire.request(url, method: .get).validate().responseJSON { response in
                //перебираем по url
                if url == postsUrl {
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let id = subJson["id"].intValue
                            let postTitle = subJson["title"].stringValue
                            let postBody = subJson["body"].stringValue
                        }
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == commentsUrl {
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let commentId = subJson["id"].intValue
                            let commentName = subJson["name"].stringValue
                            let commentEmail = subJson["email"].stringValue
                            let commentBody = subJson["body"].stringValue
                        }
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == usersUrl {
                    switch response.result {
                    case .success(let value):
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let userId = subJson["id"].intValue
                            let name = subJson["name"].stringValue
                            let userName = subJson["username"].stringValue
                            let userEmail = subJson["email"].stringValue
                            let commentBody = subJson["body"].stringValue
                            let userCity = subJson["address"]["city"].stringValue
                            let userStreet = subJson["address"]["street"].stringValue
                            let userSuite = subJson["address"]["suite"].stringValue
                            let userZipcode = subJson["address"]["zipcode"].stringValue
                            let userPhone = subJson["phone"].stringValue
                            let userWebsite = subJson["website"].stringValue
                            let userCompanyName = subJson["company"]["name"].stringValue
                            let userCompanyCatchPhrase = subJson["company"]["catchPhrase"].stringValue
                        }
                    case .failure(let error):
                        print(error)
                    }
                } else if url == photosUrl {
                    
                } else {
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
        
    }
}
