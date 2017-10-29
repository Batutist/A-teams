//
//  PostsViewController.swift
//  A-teams test
//
//  Created by Ковалева on 27.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

class PostsViewController: UIViewController {
    @IBOutlet weak var postIdLabel: UILabel!
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    
    
    
    var postId = ""
    var postTitle = ""
    var postBody = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Look here \(postId)")

        let manager = ManagerData()
        
        let post = manager.getPostFromDB().filter("postId = \(postId)")
        
        for value in post {
            postTitle.append(value.postTitle)
            postBody.append(value.postBody)
        }
        
        postIdLabel.text = postId
        postTitleLabel.text = postTitle
        postBodyLabel.text = postBody
    }
}
