//
//  ViewController.swift
//  Pompki
//
//  Created by Patryk Zapiór on 01.06.2018.
//  Copyright © 2018 Patryk Zapiór. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var licznikLabel: UILabel!
    @IBOutlet var tapRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var seriaLabel: UILabel!
    @IBOutlet weak var steper: UIStepper!
    @IBOutlet weak var liczbaPowtorzenLabel: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var licznik: Int = 0
    var licznikSerii = 1
    var ileSerii: Int = 1
    var powtorzenia: Int = 10
    var arr = [Int]()
    var zrobione: Int = 0
    var player: AVAudioPlayer? // do oddtwarzania dźwięku
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(arr[row])
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        powtorzenia = arr[row]
        self.view.backgroundColor = UIColor.white
        licznik = 0
        liczbaPowtorzenLabel.text = ("Liczba powtórzeń w serii: "+String(powtorzenia))
        licznikLabel.text = ("0/"+String(arr[row]))
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        if (Int(steper.value) >= licznikSerii){
            print(steper.value)
            ileSerii = Int(steper.value)
            seriaLabel.text = ("Seria: "+String(licznikSerii)+"/"+String(ileSerii))
        } else {
            print(steper.value)
            licznikSerii = 1
            licznik = 0
            ileSerii = Int(steper.value)
            licznikLabel.text = (String(licznik)+"/"+String(powtorzenia))
            seriaLabel.text = ("Seria: "+String(licznikSerii)+"/"+String(ileSerii))
            self.view.backgroundColor = UIColor.white

        }
    }
    //TODO: przenieść to do czujnika zbliżeniowego ------------------------
    @IBAction func tapGest(_ sender: UITapGestureRecognizer) {
   //mozna usunąć
        }
    //----------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()

        print("Is enabled: ",UIDevice.current.isProximityMonitoringEnabled)
        print("State: ",UIDevice.current.proximityState)
        
        seriaLabel.text = ("Seria: "+String(licznikSerii)+"/"+String(ileSerii))
        liczbaPowtorzenLabel.text = "Liczba powtórzeń w serii: 0"
        licznikLabel.text = (String(licznik)+"/"+String(powtorzenia))

        for i in 10...60{
            arr.append(i)
        }
        activateProximitySensor()
    }
    
    func showAlert (){
        let alert = UIAlertController(title: "Uzupełnij dane.",
                                      message: "Wprowadź ilość pompek do zrobienia w  serii.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.default,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK:- Sensor deduct when hide and show the screen when call
    func activateProximitySensor() {
        let device = UIDevice.current
        device.isProximityMonitoringEnabled = true
        if device.isProximityMonitoringEnabled {
            NotificationCenter.default.addObserver(self, selector: #selector(proximityChanged(notification:)), name: NSNotification.Name(rawValue: "UIDeviceProximityStateDidChangeNotification"), object: device)
            print("Is enabled 2: ",UIDevice.current.isProximityMonitoringEnabled)
            print("State 2: ",UIDevice.current.proximityState)
         }
    }

    var ccc: Int = 0
    var iii: Int = 0
    @objc func proximityChanged(notification: NSNotification) {
        if let device = notification.object as? UIDevice {
            print("\(device) detected!")
            print("huraaaa")
        print("State 2: ",UIDevice.current.proximityState)
        }
        ccc += 1
        print(ccc)
        if (ccc % 2 == 0) {
            playSound()
            iii += 1
            print("W ifie: ",iii)
            //ttuaj przeniesc wsszystko z tapgesture func
            self.view.backgroundColor = UIColor.white
            //wszystko z funkcji tap
//----------------------------------------------------------
            self.view.backgroundColor = UIColor.white
            zrobione += 1
            print(zrobione)
            if licznik < powtorzenia {
                licznik = licznik + 1
                if licznik == powtorzenia {
                    self.view.backgroundColor = UIColor(red: 112.0/255, green: 255.0/255, blue: 150.0/255, alpha: 1.0)
                    licznikLabel.text = (String(licznik)+"/"+String(powtorzenia))
                }else{
                    licznikLabel.text = (String(licznik)+"/"+String(powtorzenia))
                }
            } else{
                if licznikSerii < ileSerii
                {
                    licznik = 1
                    licznikSerii = licznikSerii + 1
                    licznikLabel.text = (String(licznik)+"/"+String(powtorzenia))
                    seriaLabel.text = ("Seria: "+String(licznikSerii)+"/"+String(ileSerii))
                } else {
                    print("KONIEC.")
                }
            }
//----------------------------------------------------
        } else {
            self.view.backgroundColor = UIColor(red: 112.0/255, green: 255.0/255, blue: 150.0/255, alpha: 1.0)        }
    }
    //dzwięki
    func playSound() {
        guard let url = Bundle.main.url(forResource: "sound", withExtension: "mp3") else {
            print("url not found")
            return
        }
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
 
            player!.play()
        } catch let error as NSError {
            print("error: \(error.localizedDescription)")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

