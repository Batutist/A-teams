//
//  PostsViewController.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {

    let postId = 5
    override func viewDidLoad() {
        super.viewDidLoad()

        let manager = ManagerData()
//        manager.loadJSON(loadId: postId)
        let posts = manager.getPostFromDB(postId: postId)
        print("Here are all posts: \(posts)")
    }
}
