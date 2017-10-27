//
//  Posts.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import  RealmSwift

class Posts: Object {
    @objc dynamic var postId = 0
    @objc dynamic var postTitle = ""
    @objc dynamic var postBody = ""
    
    override static func primaryKey() -> String {
        return "postId"
    }
}
