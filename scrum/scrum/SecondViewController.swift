//
//  SecondViewController.swift
//  scrum
//
//  Created by Patryk Zapiór on 14.04.2018.
//  Copyright © 2018 Patryk Zapiór. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cards = ["0","5","8","13","20","40","60","100","?"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell")
        cell?.textLabel?.text = cards[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            print("0");
            mainLabel.text = "0"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        case 1:
            print("5");
            mainLabel.text = "5"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        case 2:
            print("8");
            mainLabel.text = "8"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        case 3:
            print("13");
            mainLabel.text = "13"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        case 4:
            print("20");
            mainLabel.text = "20"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        case 5:
            print("40");
            mainLabel.text = "40"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        case 6:
            print("60");
            mainLabel.text = "60"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        case 7:
            print("100");
            mainLabel.text = "100"
            mainLabel.font = mainLabel.font.withSize(200)
            hideRightMenu()
        case 8:
            print("?");
            mainLabel.text = "?"
            mainLabel.font = mainLabel.font.withSize(300)
            hideRightMenu()
        default:
            print("Błąd");
        }
    }
    
    func hideRightMenu() {
        UIView.animate(withDuration: 0.2, animations: {
            self.rightConstraint.constant = 144
            self.view.layoutIfNeeded()
        })
    }
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var rightConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightTable: UITableView!
    @IBOutlet weak var rightView: UIView!
    @IBAction func clearButtonPress(_ sender: UIButton) {
        mainLabel.text = ""
    }
    
    @IBAction func swipeGest(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view).x
        print(translation)
        
        if (translation < -150){
            UIView.animate(withDuration: 0.2, animations: {
                self.rightConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }else if (translation > 100){
               hideRightMenu()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rightView.layer.shadowRadius = 15
        rightView.layer.shadowColor = UIColor.black.cgColor
        rightView.layer.shadowOpacity = 0.5
        rightView.layer.shadowOffset = CGSize.init(width: 5, height: 0)
        rightView.layer.cornerRadius = 10
        self.rightConstraint.constant = 144
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

