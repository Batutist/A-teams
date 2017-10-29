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

let  userDefaults  =  UserDefaults.standard

class ManagerData {
    
    func getPostFromDB() -> Results<Posts> {
        let realm = try! Realm()
        let post = realm.objects(Posts.self)
        return post
    }
    
    func getCommentFromDB() -> Results<Comments> {
        let realm = try! Realm()
        let comment = realm.objects(Comments.self)
        return comment
    }
    
    func getUserFromDB() -> Results<Users> {
        let realm = try! Realm()
        let user = realm.objects(Users.self)
        return user
    }
    
    func getPhotoFromDB() -> Results<Photos> {
        let realm = try! Realm()
        let photo = realm.objects(Photos.self)
        return photo
    }
    
    func getToDoFromDB() -> Results<ToDos> {
        let realm = try! Realm()
        let toDo = realm.objects(ToDos.self)
        return toDo
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
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let post = Posts()
                            
                            post.postId = subJson["id"].intValue
                            post.postTitle = subJson["title"].stringValue
                            post.postBody = subJson["body"].stringValue
                            
                            //пробуем записать в базу пост
                            try! realm.write {
                                realm.add(post, update: true)
                            }
                        }
                        userDefaults.set( "ok",  forKey:  "postsUrlLoad")
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == commentsUrl {
                    switch response.result {
                    case .success(let value):
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let comment = Comments()
                            
                            comment.commentId = subJson["id"].intValue
                            comment.commentName = subJson["name"].stringValue
                            comment.commentEmail = subJson["email"].stringValue
                            comment.commentBody = subJson["body"].stringValue
                            
                            //пробуем записать в базу комментарии
                            try! realm.write {
                                realm.add(comment, update: true)
                            }
                        }
                        userDefaults.set( "ok",  forKey:  "commentsUrlLoad")
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == usersUrl {
                    switch response.result {
                    case .success(let value):
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let user = Users()
                            
                            user.userId = subJson["id"].intValue
                            user.name = subJson["name"].stringValue
                            user.userName = subJson["username"].stringValue
                            user.userEmail = subJson["email"].stringValue
                            user.commentBody = subJson["body"].stringValue
                            user.userCity = subJson["address"]["city"].stringValue
                            user.userStreet = subJson["address"]["street"].stringValue
                            user.userSuite = subJson["address"]["suite"].stringValue
                            user.userZipcode = subJson["address"]["zipcode"].stringValue
                            user.userPhone = subJson["phone"].stringValue
                            user.userWebsite = subJson["website"].stringValue
                            user.userCompanyName = subJson["company"]["name"].stringValue
                            user.userCompanyCatchPhrase = subJson["company"]["catchPhrase"].stringValue
                            
                            //пробуем записать в базу пользователей
                            try! realm.write {
                                realm.add(user, update: true)
                            }
                        }
                        userDefaults.set( "ok",  forKey:  "usersUrlLoad")
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else if url == photosUrl {
                    switch response.result {
                    case .success(let value):
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let photo = Photos()
                            
                            photo.photoId = subJson["id"].intValue
                            photo.photoTitle = subJson["title"].stringValue
                            photo.photoURL = subJson["url"].stringValue
                            photo.thumbnailUrl = subJson["thumbnailUrl"].stringValue
                            
                            //пробуем записать в базу фотографии
                            try! realm.write {
                                realm.add(photo, update: true)
                            }
                        }
                        userDefaults.set( "ok",  forKey:  "photosUrlLoad")
                        
                    case .failure(let error):
                        print(error)
                    }
                    
                } else {
                    switch response.result {
                    case .success(let value):
                        
                        let json = JSON(value)
                        
                        for (_, subJson) in json {
                            let toDo = ToDos()
                            
                            toDo.toDoId = subJson["id"].intValue
                            toDo.toDoTitle = subJson["title"].stringValue
                            toDo.completed = subJson["completed"].boolValue
                            
                            //пробуем записать в базу лист задач
                            try! realm.write {
                                realm.add(toDo, update: true)
                            }
                        }
                        userDefaults.set( "ok",  forKey:  "toDosUrlLoad")
                        
                    case .failure(let error):
                        print(error)
                    }
                }
            }
        }
    }
}
