//
//  SettingsLuncher.swift
//  scrum
//
//  Created by Patryk Zapiór on 24.05.2018.
//  Copyright © 2018 Patryk Zapiór. All rights reserved.
//

import UIKit

class SettingsLuncher: NSObject {
    
    let blackView = UIView()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        return cv
    }()
    
    //more fuction
    func showSettings() {
        //przyciemnianie okna:
        if let window = UIApplication.shared.keyWindow {
            
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            //chowanie panelu i czarnego tła kiedy sie kliknie w panel
            
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            window.addSubview(blackView)
            //dodanie dolnego okna
            window.addSubview(collectionView)
            
            let height: CGFloat = 200
            let y = window.frame.height - 200
                collectionView.frame = CGRect.init(x: 0, y: window.frame.height, width: window.frame.width, height: height)
            
            blackView.frame = window.frame
            blackView.alpha = 0
            
            //dodanie aminacji przyciemniania i wysuwania okienka:
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.collectionView.frame = CGRect.init(x: 0, y: y, width: self.collectionView.frame.width, height: self.collectionView.frame.height)
            }, completion: nil)
        }
    }
    
    @objc func handleDismiss(){
        UIView.animate(withDuration: 0.5, animations: {
            self.blackView.alpha = 0
            
            if let window = UIApplication.shared.keyWindow{
            self.collectionView.frame = CGRect.init(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            }
        })
    }
    
    
    override init(){
        super.init()
        //start...
        
        
    }
}
