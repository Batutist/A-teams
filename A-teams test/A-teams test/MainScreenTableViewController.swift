//
//  MainScreenTableViewController.swift
//  A-teams test
//
//  Created by Ковалева on 23.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import UIKit

extension Int {
    static func randomUser(range: Range<Int> ) -> Int {
        var offset = 0
        
        if range.lowerBound < 0   {
            offset = abs(range.lowerBound)
        }
        
        let min = UInt32(range.lowerBound + offset)
        let max = UInt32(range.upperBound + offset)
        
        return Int(min + arc4random_uniform(max - min)) - offset
    }
}

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
    
    @IBOutlet weak var userOneInformationLabel: UILabel!
    @IBOutlet weak var userTwoInformationLabel: UILabel!
    @IBOutlet weak var userThreeInformationLabel: UILabel!
    @IBOutlet weak var userFourInformationLabel: UILabel!
    @IBOutlet weak var userFiveInformationLabel: UILabel!
    
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender == postsButton {
            let intPostIdTextfield = Int(postIdTextfield.text!)!
            
            if postIdTextfield.text == "" || postIdTextfield.text == nil {
                dontEnterIdNumber()
            }
            else if intPostIdTextfield > 100 || intPostIdTextfield < 1 {
                wrongIdNumber()
            } else {
                let postId = postIdTextfield.text
            }
        }
        else if sender == commentsButton {
            let intCommentIdTextfield = Int(commentIdTextfield.text!)!
            
            if commentIdTextfield.text == "" || commentIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intCommentIdTextfield < 1 || intCommentIdTextfield > 500 {
                wrongIdNumber()
            } else {
                let commentId = commentIdTextfield.text
                print("\(commentId!)")
            }
            
        } else if sender == usersButton {
            let intUserIdTextfield = Int(userIdTextfield.text!)!
            
            if userIdTextfield.text == "" || userIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intUserIdTextfield < 1 || intUserIdTextfield > 10 {
                wrongIdNumber()
            } else {
                let userId = userIdTextfield.text
                print("\(userId!)")
            }
            
        } else if sender == photosButton {
            let intPhotoIdTextfield = Int(photoIdTextfield.text!)!
            
            if photoIdTextfield.text == "" || photoIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intPhotoIdTextfield < 1 || intPhotoIdTextfield > 5000 {
                wrongIdNumber()
            } else {
                let photoId = photoIdTextfield.text
                print("\(photoId!)")
            }
            
        } else if sender == toDosButton {
            let intToDoIdTextfield = Int(toDoIdTextfield.text!)!
            
            if toDoIdTextfield.text == "" || toDoIdTextfield.text == nil {
                dontEnterIdNumber()
            } else if intToDoIdTextfield < 1 || intToDoIdTextfield > 200 {
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
        let alertController = UIAlertController(title: "Ошибка", message: "Вы ввели неверный номер ID.", preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OK)
        present(alertController, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefaults.string(forKey:  "postsUrlLoad") == nil ||
            userDefaults.string(forKey:  "commentsUrlLoad") == nil ||
            userDefaults.string(forKey:  "usersUrlLoad") == nil ||
            userDefaults.string(forKey:  "photosUrlLoad") == nil ||
            userDefaults.string(forKey:  "toDosUrlLoad") == nil {
            
            manager.loadJSON()
        } else {
            manager.getCommentFromDB()
            manager.getPhotoFromDB()
            manager.getPostFromDB()
            manager.getToDoFromDB()
            manager.getUserFromDB()
        }
        
        
        postsImage.image = UIImage(named: "Posts")
        commentsImage.image = UIImage(named: "Comments")
        usersImage.image = UIImage(named: "Users")
        photosImage.image = UIImage(named: "Photos")
        toDosImage.image = UIImage(named: "ToDos")
        
        let userOneIdRandom = Int.randomUser(range: 1..<11)
        let userTwoIdRandom = Int.randomUser(range: 1..<11)
        let userThreeIdRandom = Int.randomUser(range: 1..<11)
        let userFourIdRandom = Int.randomUser(range: 1..<11)
        let userFiveIdRandom = Int.randomUser(range: 1..<11)
        
        userOneInformationLabel.text = String(userOneIdRandom)
        userTwoInformationLabel.text = String(userTwoIdRandom)
        userThreeInformationLabel.text = String(userThreeIdRandom)
        userFourInformationLabel.text = String(userFourIdRandom)
        userFiveInformationLabel.text = String(userFiveIdRandom)
        
        let userOneRandom = manager.getUserFromDB().filter("userId = \(userOneIdRandom)")
        let userTwoRandom = manager.getUserFromDB().filter("userId = \(userTwoIdRandom)")
        let userThreeRandom = manager.getUserFromDB().filter("userId = \(userThreeIdRandom)")
        let userFourRandom = manager.getUserFromDB().filter("userId = \(userFourIdRandom)")
        let userFiveRandom = manager.getUserFromDB().filter("userId = \(userFiveIdRandom)")
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "postsSegue" {
            if let postId = postIdTextfield.text {
                let destinationViewController = segue.destination as! PostsViewController
                destinationViewController.postId = postId
            }
        } else if segue.identifier == "commentsSegue" {
            if let commentId = commentIdTextfield.text {
                let destinationViewController = segue.destination as! CommentsViewController
                destinationViewController.commentId = commentId
            }
        }
        
    }
}
