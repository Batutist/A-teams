//
//  Comments.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import  RealmSwift

class Comments: Object {
    @objc dynamic var commentId = 0
    @objc dynamic var commentName = ""
    @objc dynamic var commentEmail = ""
    @objc dynamic var commentBody = ""
    
    override static func primaryKey() -> String {
        return "commentId"
    }
}
