//
//  PostsViewController.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    override func viewDidLoad() {
        let string = "5"
        let postId: Int = Int(string)!
        super.viewDidLoad()

        let manager = ManagerData()
        
//        let predicate = NSPredicate(format: "postId = %@", 1)
        let posts = manager.getPostFromDB().filter("postId = \(postId)")
        print("Here are all posts: \(posts)")
    }
}
