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
    
    @IBAction func photoPreviewButtonPressed(_ sender: UIButton) {
    }
    
    var photoId = ""
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
        //load image by url, transfer to DATA, assign the resulting image to imagePreview and then set BackgroundImage of button using it
        // загружаем картинку по url, переводим в DATA, присваиваем полученное изображение в imagePreview и затем устанавливаем с помощью него BackgroundImage кнопки
        let imgPreviewURL: NSURL = NSURL(string: thumbnailUrl)!
        let imgPreviewData: NSData = NSData(contentsOf: imgPreviewURL as URL)!
        let imagePreview: UIImage = UIImage(data: imgPreviewData as Data)!
        photoPreviewButton.setBackgroundImage(imagePreview, for: UIControlState.normal)
    }
}
