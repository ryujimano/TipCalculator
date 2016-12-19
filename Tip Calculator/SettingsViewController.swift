//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Ryuji Mano on 12/18/16.
//  Copyright © 2016 Ryuji Mano. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var modeLabel: UILabel!

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    @IBOutlet weak var onLabel: UILabel!
    @IBOutlet weak var offLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if (UserDefaults.standard.value(forKey: "darkMode") != nil) {
            let dark = UserDefaults.standard.value(forKey: "darkMode")
            if (dark as! Bool) {
                tipControl.tintColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                tipControl.backgroundColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                modeLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                offLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                onLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                tipLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                self.view.backgroundColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                modeSwitch.setOn(true, animated: false)
            }
            else {
                tipControl.tintColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                tipControl.backgroundColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                modeLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                offLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                onLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                tipLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                self.view.backgroundColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                modeSwitch.setOn(false, animated: false)
            }
        }
        
        if (UserDefaults.standard.value(forKey: "selectedIndex") != nil) {
            let si = UserDefaults.standard.value(forKey: "selectedIndex")
            tipControl.selectedSegmentIndex = si as! Int
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTapControl(_ sender: AnyObject) {
        UserDefaults.standard.setValue(tipControl.selectedSegmentIndex, forKey: "selectedIndex")
    }
    
    @IBAction func onSwitch(_ sender: AnyObject) {
        UserDefaults.standard.setValue(self.modeSwitch.isOn, forKey: "darkMode")
        if (self.modeSwitch.isOn) {
            tipControl.tintColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
            tipControl.backgroundColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
            modeLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
            offLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
            onLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
            tipLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
            self.view.backgroundColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
        }
        else {
            tipControl.tintColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
            tipControl.backgroundColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
            modeLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
            offLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
            onLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
            tipLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
            self.view.backgroundColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
        }
    }

}
