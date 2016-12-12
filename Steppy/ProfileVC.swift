//
//  UserInfoVC.swift
//  steppy2.0
//
//  Created by Steven Lee on 11/17/16.
//  Copyright © 2016 Steven Lee. All rights reserved.
//

import UIKit
import SQLite
import HealthKit

class ProfileVC: UIViewController {
    // Locals Info
    var uName = ""
    var uAge = ""
    var uSex = ""
    var uBMI = ""
    var stepTotal = ""
    var aroundTheWorld = ""
    var toTheMoon = ""
    var avgGoal = ""
    
    // TODO
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = _backgroundColor
        // Labels and Buttons
        loadDBToLocals()
        /// NEEED SDESIGN
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        let ageLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        let genderLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        let bmiStatusLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        let stepTotalLbl = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        
        
        nameLabel.center = CGPoint(x: 160, y: 100)
        ageLbl.center = CGPoint(x: 160, y: 150)
        genderLbl.center = CGPoint(x: 160, y: 200)
        bmiStatusLbl.center = CGPoint(x: 160, y: 250)
        stepTotalLbl.center = CGPoint(x: 160, y: 300)
        
        // Set Label Title
        nameLabel.text = uName
        ageLbl.text = uAge
        genderLbl.text = uSex
        bmiStatusLbl.text = uBMI
        stepTotalLbl.text = stepTotal
        
        nameLabel.textColor = _fontColor
        genderLbl.textColor = _fontColor
        bmiStatusLbl.textColor = _fontColor
        ageLbl.textColor = _fontColor
        stepTotalLbl.textColor = _fontColor
        
        
        // add to view
        view.addSubview(nameLabel)
        view.addSubview(ageLbl)
        view.addSubview(genderLbl)
        view.addSubview(bmiStatusLbl)
        view.addSubview(stepTotalLbl)
        
        
        
        
    }
    
    func loadDBToLocals() {
        var stepTotalCount : Int64
        stepTotalCount = 0
        for user in try! db.prepare(users) {
            if (user[email] == username) {
                uName = "\(user[fName]) \(user[lName]!)"
                uAge = "\(user[age])"
                uBMI = "\(user[weight])"
                if(user[sex] == "m"){
                    uSex = "Male"
                } else {
                    uSex = "Female"
                }
                
                
                
            }
        }
        
        for t in try! db.prepare(health) {
            if (t[uId] == username) {
                stepTotalCount = stepTotalCount + t[steps]
            }
        }
        stepTotal = "Total Steps: \(stepTotalCount)"
    }
    
}
