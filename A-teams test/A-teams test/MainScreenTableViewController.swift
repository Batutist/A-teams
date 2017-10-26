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
            
            if postIdTextfield.text == "" || postIdTextfield.text == nil {
                let alertController = UIAlertController(title: "Ошибка", message: "Вы не ввели ID.", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(OK)
                present(alertController, animated: true, completion: nil)
//            } else if postIdTextfield.text!.count > 100 || postIdTextfield.text!.count < 1 {
//                let alertController = UIAlertController(title: "Ошибка", message: "Вы не ввели слишком большой номер ID. Введите цифру от 1 до 100.", preferredStyle: .alert)
//                let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
//                alertController.addAction(OK)
//                present(alertController, animated: true, completion: nil)
            } else {
                let postId = postIdTextfield.text
                print("\(postId!)")
            }
            
        } else if sender == commentsButton {
            
            if commentIdTextfield.text == "" || commentIdTextfield.text == nil {
                let alertController = UIAlertController(title: "Ошибка", message: "Вы не ввели ID.", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(OK)
                present(alertController, animated: true, completion: nil)
            } else {
                let commentId = commentIdTextfield.text
                print("\(commentId!)")
            }
            
        } else if sender == usersButton {
            
            if userIdTextfield.text == "" || userIdTextfield.text == nil {
                let alertController = UIAlertController(title: "Ошибка", message: "Вы не ввели ID.", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(OK)
                present(alertController, animated: true, completion: nil)
            } else {
                let userId = userIdTextfield.text
                print("\(userId!)")
            }
            
        } else if sender == photosButton {
            
            if photoIdTextfield.text == "" || photoIdTextfield.text == nil {
                let alertController = UIAlertController(title: "Ошибка", message: "Вы не ввели ID.", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(OK)
                present(alertController, animated: true, completion: nil)
            } else {
                let photoId = photoIdTextfield.text
                print("\(photoId!)")
            }
            
        } else if sender == toDosButton {
            
            if toDoIdTextfield.text == "" || toDoIdTextfield.text == nil {
                let alertController = UIAlertController(title: "Ошибка", message: "Вы не ввели ID.", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(OK)
                present(alertController, animated: true, completion: nil)
            } else {
                let toDoId = toDoIdTextfield.text
                print("\(toDoId!)")
            }
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
        
        
        
    }
}
