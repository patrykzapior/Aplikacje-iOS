//
//  ViewController.swift
//  slideMenu
//
//  Created by Patryk Zapiór on 26.03.2018.
//  Copyright © 2018 Patryk Zapiór. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var constLeft: NSLayoutConstraint!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet var penGest: UIPanGestureRecognizer!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var pushButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    blur.layer.shadowRadius = 15
    sideView.layer.shadowColor = UIColor.black.cgColor
    sideView.layer.shadowOpacity = 0.5
    sideView.layer.shadowOffset = CGSize.init(width: 5, height: 0)
    sideView.layer.cornerRadius = 10
    constLeft.constant = -320
        
    showButton.layer.shadowOpacity = 0.5
    showButton.layer.cornerRadius = 7
    pushButton.layer.shadowOpacity = 0.5
    pushButton.layer.cornerRadius = 7
    }

    @IBAction func penGest(_ sender: UIPanGestureRecognizer) {
        if sender.state == .began || sender.state == .changed{
            let translation = sender.translation(in: self.view).x
            
            if translation > 0 {
                if constLeft.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.constLeft.constant += translation / 2
                        self.view.layoutIfNeeded()
                    })
                }
            }else {
                if constLeft.constant > -320{
                    UIView.animate(withDuration: 0.2, animations: {
                        self.constLeft.constant += translation / 2
                        self.view.layoutIfNeeded()
                    })
                }
            }
        }
        else if sender.state == .ended{
            if constLeft.constant < -100{
                UIView.animate(withDuration: 0.2, animations: {
                    self.constLeft.constant = -320
                    self.view.layoutIfNeeded()
                })
            }else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.constLeft.constant = 0
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    @IBAction func moreButtonPress(_ sender: UIBarButtonItem) {
        if constLeft.constant < 0 {
            constLeft.constant = 0
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        }else if constLeft.constant == 0 {
            constLeft.constant = -320
            UIView.animate(withDuration: 0.2, animations: {
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

