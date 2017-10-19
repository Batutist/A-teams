//
//  FirstViewController.swift
//  A-teams test
//
//  Created by Ковалева on 19.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    let cardsForMainScreen = ["Posts", "Comments", "Users", "Photos", "ToDos"]
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cardsForMainScreen.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let title = cell.viewWithTag(1) as! UILabel
        title.text = cardsForMainScreen[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
