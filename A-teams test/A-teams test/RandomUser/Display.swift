//
//  DisplayUserInfo.swift
//  A-teams test
//
//  Created by Ковалева on 03.11.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//



import Foundation
import UIKit
import RealmSwift

// template class with func, takes random user and return String value with user information
// шаблонный класс с функцией принимающей случайного пользователя и возвращающей String значение с информацией о пользователе в удобной форме
class Display {
    
    func infoOf(user: Results<Users>) -> String {
        let tmp = Users()
        for value in user {
            tmp.userName = value.userName
            tmp.userEmail = value.userEmail
            tmp.userCity = value.userCity
            tmp.userPhone = value.userPhone
        }
        return ("Name is: \(tmp.userName), user Email is: \(tmp.userEmail), he(she) lives in: \(tmp.userCity), and tel: \(tmp.userPhone)")
    }
}

