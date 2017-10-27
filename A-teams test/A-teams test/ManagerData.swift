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
import RealmSwift

class ManagerData {
    
    func getPostsFromDB() -> Results<Posts> {
        let realm = try! Realm()
        let posts = realm.objects(Posts.self)
        return posts
    }
    
    func loadJSON() {
        print("Путь к файлам \(Realm.Configuration.defaultConfiguration.fileURL)")
        
        let realm = try! Realm()
        
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
                        let posts = Posts()
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let tmp = PostsData()
                            
                            tmp.postId = subJson["id"].intValue
                            tmp.postTitle = subJson["title"].stringValue
                            tmp.postBody = subJson["body"].stringValue
                            posts.tempList.append(tmp)
                        }
                        //пробуем записать в базу посты
                        try! realm.write {
                            realm.add(posts, update: true)
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == commentsUrl {
                    switch response.result {
                    case .success(let value):
                        let comments = Comments()
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let tmp = CommentsData()
                            
                            tmp.commentId = subJson["id"].intValue
                            tmp.commentName = subJson["name"].stringValue
                            tmp.commentEmail = subJson["email"].stringValue
                            tmp.commentBody = subJson["body"].stringValue
                            
                            comments.tempList.append(tmp)
                        }
                        //пробуем записать в базу комментарии
                        try! realm.write {
                            realm.add(comments, update: true)
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == usersUrl {
                    switch response.result {
                    case .success(let value):
                        let users = Users()
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let tmp = UsersData()
                            
                            tmp.userId = subJson["id"].intValue
                            tmp.name = subJson["name"].stringValue
                            tmp.userName = subJson["username"].stringValue
                            tmp.userEmail = subJson["email"].stringValue
                            tmp.commentBody = subJson["body"].stringValue
                            tmp.userCity = subJson["address"]["city"].stringValue
                            tmp.userStreet = subJson["address"]["street"].stringValue
                            tmp.userSuite = subJson["address"]["suite"].stringValue
                            tmp.userZipcode = subJson["address"]["zipcode"].stringValue
                            tmp.userPhone = subJson["phone"].stringValue
                            tmp.userWebsite = subJson["website"].stringValue
                            tmp.userCompanyName = subJson["company"]["name"].stringValue
                            tmp.userCompanyCatchPhrase = subJson["company"]["catchPhrase"].stringValue
                            
                            users.tempList.append(tmp)
                        }
                        
                        //пробуем записать в базу пользователей
                        try! realm.write {
                            realm.add(users, update: true)
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == photosUrl {
                    switch response.result {
                    case .success(let value):
                        let photos = Photos()
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let tmp = PhotosData()
                            
                            tmp.photoId = subJson["id"].intValue
                            tmp.photoTitle = subJson["title"].stringValue
                            tmp.photoURL = subJson["url"].stringValue
                            tmp.thumbnailUrl = subJson["thumbnailUrl"].stringValue
                            
                            photos.tempList.append(tmp)
                        }
                        
                        //пробуем записать в базу фотографии
                        try! realm.write {
                            realm.add(photos, update: true)
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else {
                    switch response.result {
                    case .success(let value):
                        let toDos = ToDos()
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let tmp = ToDosData()
                            
                            tmp.toDoId = subJson["id"].intValue
                            tmp.toDoTitle = subJson["title"].stringValue
                            tmp.completed = subJson["completed"].boolValue
                            
                            toDos.tempList.append(tmp)
                        }
                        
                        //пробуем записать в базу лист задач
                        try! realm.write {
                            realm.add(toDos, update: true)
                        }
                        
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
        
    }
}
