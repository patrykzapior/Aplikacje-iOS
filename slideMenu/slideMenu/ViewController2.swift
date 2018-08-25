//
//  ViewController2.swift
//  slideMenuTests
//
//  Created by Patryk Zapiór on 01.04.2018.
//  Copyright © 2018 Patryk Zapiór. All rights reserved.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var kontoWidok: UILabel!
    @IBOutlet weak var rightContraint: NSLayoutConstraint!
    @IBOutlet weak var leftContraint: NSLayoutConstraint!
    
    
    var array = ["Konto","Odtwarzanie","Urządzenia","Jakość muzyki","Społeczność"]
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (array.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = array[indexPath.row]
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
