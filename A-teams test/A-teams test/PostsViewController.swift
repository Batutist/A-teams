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
        // create ManagerData object
        // создаем оъект класса ManagerData
        let manager = ManagerData()
        
        // get post by postId from dataBase
        // получаем пост из БД по ID
        let post = manager.getPostFromDB().filter("postId = \(postId)")
        
        for value in post {
            postTitle.append(value.postTitle)
            postBody.append(value.postBody)
        }
        // display post information in PostsViewController
        // отображаем post информацию в PostsViewController
        postIdLabel.text = "Post ID: \(postId)"
        postTitleLabel.text = postTitle
        postBodyLabel.text = postBody
    }
}
