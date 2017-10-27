//
//  ToDosData.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import RealmSwift

class ToDosData: Object {
    @objc dynamic var toDoId = 0
    @objc dynamic var toDoTitle = ""
    @objc dynamic var completed = false
    
//    override static func primaryKey() -> String {
//        return "toDoId"
//    }
}
