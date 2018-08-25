//
//  FirstViewController.swift
//  scrum
//
//  Created by Patryk Zapiór on 14.04.2018.
//  Copyright © 2018 Patryk Zapiór. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    
    var pWyd:Double  = 0
    var pDni:Double  = 0
    var dWyd:Double  = 0
    var dDni:Double  = 0
    var aWyd:Double  = 0
    var aDni:Double  = 0
    var eWyd:Double  = 0
    var eDni:Double  = 0
    var agWyd:Double = 0
    var agDni:Double = 0
    var rWyd:Double  = 0
    var rDni:Double  = 0
    var arWyd:Double = 0
    var arDni:Double = 0
    var lWyd:Double  = 0
    var lDni:Double  = 0
    //----
    var sumaDniUrlopowych: Double = 0
    var temp: Double = 0
    var dniOff: Double = 0
    var final: Double = 0
    //labelki z imionami
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    @IBOutlet weak var label6: UILabel!
    @IBOutlet weak var label7: UILabel!
    @IBOutlet weak var label8: UILabel!
    //labelki z wydajnoscia
    @IBOutlet weak var wyd1: UITextField!
    @IBOutlet weak var wyd2: UITextField!
    @IBOutlet weak var wyd3: UITextField!
    @IBOutlet weak var wyd4: UITextField!
    @IBOutlet weak var wyd5: UITextField!
    @IBOutlet weak var wyd6: UITextField!
    @IBOutlet weak var wyd7: UITextField!
    @IBOutlet weak var wyd8: UITextField!
    //labelki z dniami wolnymi
    @IBOutlet weak var dni1: UITextField!
    @IBOutlet weak var dni2: UITextField!
    @IBOutlet weak var dni3: UITextField!
    @IBOutlet weak var dni4: UITextField!
    @IBOutlet weak var dni5: UITextField!
    @IBOutlet weak var dni6: UITextField!
    @IBOutlet weak var dni7: UITextField!
    @IBOutlet weak var dni8: UITextField!
    //button
    @IBOutlet weak var moreButton: UIButton!
    
    @IBOutlet weak var iloscDniLabel: UITextField!
    @IBOutlet weak var liczbaStoryPointowLabel: UILabel!
    @IBOutlet weak var liczbaGodzinLabel: UILabel!
    @IBOutlet weak var godziny: UILabel!
    @IBOutlet weak var storyPointy: UILabel!
    @IBOutlet weak var buttonOblicz: UIButton!
    
    let persons: [String] = ["Patryk:","Darek:","Andrzej:","Ela:","Agata:","Rafał:","Arek:","Łukasz:"]
    
    func setPersonsLabels(){
        label1.text = persons[0]
        label2.text = persons[1]
        label3.text = persons[2]
        label4.text = persons[3]
        label5.text = persons[4]
        label6.text = persons[5]
        label7.text = persons[6]
        label8.text = persons[7]
    }
    
    func showAlert (){
        let alert = UIAlertController(title: "Uzupełnij dane.",
                                      message: "Wprowadź brakujace wartości.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style:UIAlertActionStyle.default,handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    //funkcja licząca
    func calculate () {
        if     wyd1.text   == ""
            || wyd2.text   == ""
            || wyd3.text   == ""
            || wyd3.text   == ""
            || wyd4.text   == ""
            || wyd5.text   == ""
            || wyd6.text   == ""
            || wyd7.text   == ""
            || wyd8.text   == ""
            || dni1.text == ""
            || dni2.text == ""
            || dni3.text == ""
            || dni4.text == ""
            || dni5.text == ""
            || dni6.text == ""
            || dni7.text == ""
            || dni8.text == ""
            || iloscDniLabel.text == ""
        {
            showAlert()
        }
        else {
             pWyd  = Double(wyd1.text!)!
             pDni  = Double(dni1.text!)!
             dWyd  = Double(wyd2.text!)!
             dDni  = Double(dni2.text!)!
             aWyd  = Double(wyd3.text!)!
             aDni  = Double(dni3.text!)!
             eWyd  = Double(wyd4.text!)!
             eDni  = Double(dni4.text!)!
             agWyd = Double(wyd5.text!)!
             agDni = Double(dni5.text!)!
             rWyd  = Double(wyd6.text!)!
             rDni  = Double(dni6.text!)!
             arWyd = Double(wyd7.text!)!
             arDni = Double(dni7.text!)!
             lWyd  = Double(wyd8.text!)!
             lDni  = Double(dni8.text!)!
             dniOff = Double(iloscDniLabel.text!)!
        }
        print("pWyd: ",pWyd)
        print("agWyd: ",agWyd)
        print("łWyd: ",lWyd)
        print("pDni: ",pDni)
        print("agDni: ",agDni)
        print("łDni: ",lDni)
        print("Dni off: ",dniOff)
        
        sumaDniUrlopowych = (pDni + dDni + aDni + eDni + agDni + rDni + arDni + lDni)
        print(sumaDniUrlopowych)
        temp = ((pWyd + dWyd + aWyd + eWyd + agWyd + rWyd + arWyd + lWyd) * dniOff) - sumaDniUrlopowych
        print(temp)
        final = temp * 0.7 * 8
        print(final)
        storyPointy.text = String(final)
        godziny.text = String(final * 0.6)
        liczbaStoryPointowLabel.isHidden = false
        liczbaGodzinLabel.isHidden = false
        
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            liczbaStoryPointowLabel.isHidden = true
            liczbaGodzinLabel.isHidden = true
            
            setPersonsLabels() //funkcja ustawia imiona w labelkach
            
        }
    @IBAction func obliczButtonPress(_ sender: UIButton) {
        calculate()

        godziny.isHidden = false
        storyPointy.isHidden = false
        liczbaStoryPointowLabel.isHidden = false
        liczbaGodzinLabel.isHidden = false
    }
    let settingsLuncher = SettingsLuncher()
    
    @IBAction func moreButtonPress(_ sender: UIButton) {
        settingsLuncher.showSettings()
    }
    
    //chowanie klawiatury po klieknieciu w formatke
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

