//
//  FirstCollectionViewController.swift
//  A-teams test
//
//  Created by Ковалева on 19.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class FirstCollectionViewController: UICollectionViewController {
//    @IBAction func postsIdButtonPressed(_ sender: UIButton) {
//    }
    let cardsForMainScreen = ["Posts", "Comments", "Users", "Photos", "ToDos"]
    let placeholders = ["Введите ID поста", "Введите ID комментария", "Введите ID пользователя", "Введите ID фотографии", "Введите ID задачи"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)

//        cell.cardName.text = cardsForMainScreen[indexPath.row]
//        cell.idTextField.placeholder = placeholders[indexPath.row]

        return cell
    }
}
