//
//  UsersViewController.swift
//  A-teams test
//
//  Created by Ковалева on 30.10.17.
//  Copyright © 2017 Ковалев. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userCityLabel: UILabel!
    @IBOutlet weak var userStreetLabel: UILabel!
    @IBOutlet weak var userSuiteLabel: UILabel!
    @IBOutlet weak var userZipcodeLabel: UILabel!
    @IBOutlet weak var userPhoneLabel: UILabel!
    @IBOutlet weak var userWebsiteLabel: UILabel!
    @IBOutlet weak var userCompanyNameLabel: UILabel!
    @IBOutlet weak var userCompanyCatchPhraseLabel: UILabel!
    
    var userId = ""
    var name = ""
    var userName = ""
    var userEmail = ""
    var userCity = ""
    var userStreet = ""
    var userSuite = ""
    var userZipcode = ""
    var userPhone = ""
    var userWebsite = ""
    var userCompanyName = ""
    var userCompanyCatchPhrase = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // create ManagerData object
        // создаем объект класса ManagerData
        let manager = ManagerData()
        // get user from DB by commentId
        // получаем пользователя из БД по ID
        let user = manager.getUserFromDB().filter("userId = \(userId)")
        
        for value in user {
            name.append(value.name)
            userName.append(value.userName)
            userEmail.append(value.userEmail)
            userCity.append(value.userCity)
            userStreet.append(value.userStreet)
            userSuite.append(value.userSuite)
            userZipcode.append(value.userZipcode)
            userPhone.append(value.userPhone)
            userWebsite.append(value.userWebsite)
            userCompanyName.append(value.userCompanyName)
            userCompanyCatchPhrase.append(value.userCompanyCatchPhrase)
            
        }
        
        userIdLabel.text = "User ID is: \(userId)"
        nameLabel.text = "Name: \(name)"
        userNameLabel.text = "Username is: \(userName)"
        userEmailLabel.text = "User Email is: \(userEmail)"
        userCityLabel.text = "City he(she) lives: \(userCity)"
        userStreetLabel.text = "His(her) street: \(userStreet)"
        userSuiteLabel.text = "Suite: \(userSuite)"
        userZipcodeLabel.text = "Postal Zipcode: \(userZipcode)"
        userPhoneLabel.text = "Phone num.: \(userPhone)"
        userWebsiteLabel.text = "His(her) website: \(userWebsite)"
        userCompanyNameLabel.text = "Company he(she) work: \(userCompanyName)"
        userCompanyCatchPhraseLabel.text = "Company catch phrase: \(userCompanyCatchPhrase)"
        
        
    }
}
