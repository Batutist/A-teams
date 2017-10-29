//
//  PostsViewController.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    var postId = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Look here \(postId)")

        let manager = ManagerData()
        
//        let predicate = NSPredicate(format: "postId = %@", 1)
        let posts = manager.getPostFromDB().filter("postId = \(postId)")
        print("Here are all posts: \(posts)")
    }
}
