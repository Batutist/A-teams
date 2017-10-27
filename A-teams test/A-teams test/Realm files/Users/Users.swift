//
//  Users.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import  RealmSwift

class Users: Object {
    @objc dynamic var userId = 0
    @objc dynamic var name = ""
    @objc dynamic var userName = ""
    @objc dynamic var userEmail = ""
    @objc dynamic var commentBody = ""
    @objc dynamic var userCity = ""
    @objc dynamic var userStreet = ""
    @objc dynamic var userSuite = ""
    @objc dynamic var userZipcode = ""
    @objc dynamic var userPhone = ""
    @objc dynamic var userWebsite = ""
    @objc dynamic var userCompanyName = ""
    @objc dynamic var userCompanyCatchPhrase = ""
    
    override static func primaryKey() -> String {
        return "userId"
    }

}
