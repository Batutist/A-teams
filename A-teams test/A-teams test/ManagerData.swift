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

//class with methods to get and save to DB information from https://jsonplaceholder.typicode.com
//класс с методами для получения информации из https://jsonplaceholder.typicode.com и дальнейшего сохранения в базу данных
class ManagerData {
    

    // func with requst by url and saving data to DB
    //функция с запросом по url и сохранением в БД
    func loadJSON() {
        print("Путь к файлам \(String(describing: Realm.Configuration.defaultConfiguration.fileURL))")
        // create Realm object
        // создаем обьект Realm
        let realm = try! Realm()
        // urls for use in API request
        // адреса для использования в API запросах
        let postsUrl = "https://jsonplaceholder.typicode.com/posts"
        let commentsUrl = "https://jsonplaceholder.typicode.com/comments"
        let usersUrl = "https://jsonplaceholder.typicode.com/users"
        let photosUrl = "https://jsonplaceholder.typicode.com/photos"
        let toDosUrl = "https://jsonplaceholder.typicode.com/todos"
        
        // urls array
        // массив адресов
        let urlArray = [postsUrl, commentsUrl, usersUrl, photosUrl, toDosUrl]
        
        for url in urlArray {
            let url = url
            //JSON request
            //запрос JSON
            Alamofire.request(url, method: .get).validate().responseJSON { response in
                //switch by url
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
                            
                            // Try to write posts into data base
                            //пробуем записать в базу пост
                            try! realm.write {
                                realm.add(post, update: true)
                            }
                        }
                        userDefaults.set( "ok",  forKey:  "postsUrlLoad")
                        // if can't write print error
                        // в случае неудачи печатаем ошибку
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
                            
                            // Try to write comments into data base
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
                            
                            // Try to write users into data base
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
                            
                            // Try to write photos into data base
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
                            
                            // Try to write toDos into data base
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
    //functions to get data from dataBase (posts, comments, users, photos, toDos)
    //функция для получения данных из БД (posts, comments, users, photos, toDos)
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
}
