//
//  PhotosData.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import RealmSwift

class PhotosData: Object {
    @objc dynamic var userPhotoId = 0
    @objc dynamic var userPhotoPreviewURL = ""
    @objc dynamic var userPhotoURL = ""
    
    override static func primaryKey() -> String {
        return "userPhotoId"
    }
}
