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
            let intPostIdTextfield = Int(postIdTextfield.text!)!
            
            if postIdTextfield.text == "" || postIdTextfield.text == nil {
                dontEnterIdNumber()
            }
            else if intPostIdTextfield > 100 || intPostIdTextfield < 1 {
                wrongIdNumber()
            } else {
                func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    if segue.identifier == "postsSegue" {
                        if let postId = postIdTextfield.text {
                            let destinationViewController = segue.destination as! PostsViewController
                            destinationViewController.postId = postId
                        }
                    }
                }
            }
        }
         else if sender == commentsButton {
            let intCommentIdTextfield = Int(commentIdTextfield.text!)!
            
            if commentIdTextfield.text == "" || commentIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intCommentIdTextfield < 1 || intCommentIdTextfield > 100 {
                wrongIdNumber()
            } else {
                let commentId = commentIdTextfield.text
                print("\(commentId!)")
            }
            
        } else if sender == usersButton {
            let intUserIdTextfield = Int(userIdTextfield.text!)!
            
            if userIdTextfield.text == "" || userIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intUserIdTextfield < 1 || intUserIdTextfield > 100 {
                wrongIdNumber()
            } else {
                let userId = userIdTextfield.text
                print("\(userId!)")
            }
            
        } else if sender == photosButton {
            let intPhotoIdTextfield = Int(photoIdTextfield.text!)!
            
            if photoIdTextfield.text == "" || photoIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intPhotoIdTextfield < 1 || intPhotoIdTextfield > 100 {
                wrongIdNumber()
            } else {
                let photoId = photoIdTextfield.text
                print("\(photoId!)")
            }
            
        } else if sender == toDosButton {
            let intToDoIdTextfield = Int(toDoIdTextfield.text!)!
            
            if toDoIdTextfield.text == "" || toDoIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intToDoIdTextfield < 1 || intToDoIdTextfield > 100 {
                wrongIdNumber()
            }else {
                let toDoId = toDoIdTextfield.text
//                print("\(toDoId!)")
                
            }
        }
    }
    
    func dontEnterIdNumber() {
        let alertController = UIAlertController(title: "Ошибка", message: "Вы не ввели ID.", preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OK)
        present(alertController, animated: true, completion: nil)
    }
    
    func wrongIdNumber() {
        let alertController = UIAlertController(title: "Ошибка", message: "Вы ввели неверный номер ID. Введите цифру от 1 до 100.", preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OK)
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.loadJSON()
        
        postsImage.image = UIImage(named: "Posts")
        commentsImage.image = UIImage(named: "Comments")
        usersImage.image = UIImage(named: "Users")
        photosImage.image = UIImage(named: "Photos")
        toDosImage.image = UIImage(named: "ToDos")
        
        
        
    }
    
    
}
