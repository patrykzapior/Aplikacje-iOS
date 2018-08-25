//
//  ViewController3.swift
//  slideMenu
//
//  Created by Patryk Zapiór on 01.04.2018.
//  Copyright © 2018 Patryk Zapiór. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var rightConstreint: NSLayoutConstraint!
    @IBOutlet weak var leftContraint: NSLayoutConstraint!
    @IBOutlet weak var rightButton: UIBarButtonItem!
    @IBOutlet weak var mainView: UIView!
    
    @IBAction func swipeGest(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view).x
        print(translation)
        
        if sender.state == .began || sender.state == .changed{
            self.rightConstreint.constant = translation
            self.leftContraint.constant = translation
           
            if translation > 100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.rightConstreint.constant = 320
                    self.leftContraint.constant = 320
                })
            }else if translation < -100 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.rightConstreint.constant = -320
                    self.leftContraint.constant = -320
                })
            }
        }else if sender.state == .ended{}
    }
    
    @IBAction func rightButtonClick(_ sender: UIBarButtonItem) {
        print(rightConstreint.constant)
        if rightConstreint.constant == 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.rightConstreint.constant = -200
                self.leftContraint.constant = -200
                self.view.layoutIfNeeded()
            })
        }else if rightConstreint.constant < 0 {
            UIView.animate(withDuration: 0.2, animations: {
                self.rightConstreint.constant = 0
                self.leftContraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOpacity = 0.7
        mainView.layer.shadowOffset = CGSize.init(width: 6, height: 0)
      //  mainView.layer.cornerRadius = 15
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
