//
//  MainScreenTableViewController.swift
//  A-teams test
//
//  Created by Ковалева on 23.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import UIKit

class MainScreenTableViewController: UITableViewController {
    let manager = ManagerData()
    
    @IBOutlet weak var postIdTextfield: UITextField!
    @IBOutlet weak var commentIdTextfield: UITextField!
    @IBOutlet weak var userIdTextfield: UITextField!
    @IBOutlet weak var photoIdTextfield: UITextField!
    @IBOutlet weak var toDoIdTextfield: UITextField!
    
    @IBOutlet weak var postsImage: UIImageView!
    @IBOutlet weak var commentsImage: UIImageView!
    @IBOutlet weak var usersImage: UIImageView!
    @IBOutlet weak var photosImage: UIImageView!
    @IBOutlet weak var toDosImage: UIImageView!
    
    @IBOutlet weak var postsButton: UIButton!
    @IBOutlet weak var commentsButton: UIButton!
    @IBOutlet weak var usersButton: UIButton!
    @IBOutlet weak var photosButton: UIButton!
    @IBOutlet weak var toDosButton: UIButton!
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender == postsButton {
            print("posts button")
        } else if sender == commentsButton {
            print("comments button")
        } else if sender == usersButton {
            print("users button")
        } else if sender == photosButton {
            print("photos button")
        } else if sender == toDosButton {
            print("toDos button")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.loadJSON()
        
        postsImage.image = UIImage(named: "Posts")
        commentsImage.image = UIImage(named: "Comments")
        usersImage.image = UIImage(named: "Users")
        photosImage.image = UIImage(named: "Users")
        toDosImage.image = UIImage(named: "ToDos")
        
        
        let postId = postIdTextfield.text
        let commentId = commentIdTextfield.text
        let userId = userIdTextfield.text
        let photoId = photoIdTextfield.text
        let toDoId = toDoIdTextfield.text
    }
}
