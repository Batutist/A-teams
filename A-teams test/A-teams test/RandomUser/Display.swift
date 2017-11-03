//
//  DisplayUserInfo.swift
//  A-teams test
//
//  Created by Ковалева on 03.11.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

//попытка сделать общую функцию для отображения информации пользователей в MainScreenTableViewController

import Foundation
import UIKit
import RealmSwift

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

