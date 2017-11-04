//
//  PhotosViewController.swift
//  A-teams test
//
//  Created by Ковалева on 05.11.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import Foundation
import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet weak var photoIdLabel: UILabel!
    @IBOutlet weak var photoTitleLabel: UILabel!
    @IBOutlet weak var photoPreviewButton: UIButton!
    
    @IBOutlet weak var imagetest: UIImageView!
    @IBAction func photoPreviewButtonPressed(_ sender: UIButton) {
    }
    
    var photoId = "5"
    var photoTitle = ""
    var thumbnailUrl = ""
    var photoURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create ManagerData object
        // создаем объект класса ManagerData
        let manager = ManagerData()
        // get photo from DB by commentId
        // получаем фотографию из БД по ID
        let photo = manager.getPhotoFromDB().filter("photoId = \(photoId)")
        
        for value in photo {
            photoTitle.append(value.photoTitle)
            thumbnailUrl.append(value.thumbnailUrl)
            photoURL.append(value.photoURL)
        }
        print("id: \(photoId), title: \(photoTitle), url: \(photoURL), thumbnailURL: \(thumbnailUrl)")
        //        imagePreview.image = UIImage(data: imgData as Data)
        //        imagetest.image = UIImage(data: imgPreviewData as Data)
        //        let imgPreviewURL: NSURL = NSURL(string: thumbnailUrl)!
        //        let imgPreviewData: NSData = NSData(contentsOf: imgPreviewURL as URL)!
        //        let imagePreview: UIImage = UIImage(data: imgPreviewData as Data)!
        //        photoPreviewButton.setImage(imagePreview, for: UIControlState.normal)
        
    }
}
