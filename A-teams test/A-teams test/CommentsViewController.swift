//
//  CommentsViewController.swift
//  A-teams test
//
//  Created by Ковалева on 30.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

class CommentsViewController: UIViewController {
    @IBOutlet weak var commentIdLabel: UILabel!
    @IBOutlet weak var commentNameLable: UILabel!
    @IBOutlet weak var commentBodyLable: UILabel!
    @IBOutlet weak var commentEmailLabel: UILabel!
    
    
    var commentId = ""
    var commentName = ""
    var commentEmail = ""
    var commentBody = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Look here \(commentId)")

        let manager = ManagerData()

        let comment = manager.getCommentFromDB().filter("commentId = \(commentId)")

        for value in comment {
            commentName.append(value.commentName)
            commentEmail.append(value.commentEmail)
            commentBody.append(value.commentBody)

        }
        print("Id: \(commentId), name: \(commentName), Email: \(commentEmail), body: \(commentBody)")
        commentIdLabel.text = "Comment ID: \(commentId)"
        commentNameLable.text = commentName
        commentEmailLabel.text = commentEmail
        commentBodyLable.text = commentBody
        
    }
}
