//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Ryuji Mano on 9/15/16.
//  Copyright © 2016 Ryuji Mano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var keyboardHeight:CGFloat = 0.0
    var screenSize:CGSize = CGSize.init()
    var screenHeight:CGFloat = 0.0
    
    var current:Date?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        amountTextField.becomeFirstResponder()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (UserDefaults.standard.value(forKey: "amount") != nil) {
            if (UserDefaults.standard.value(forKey: "current") != nil) {
                current = UserDefaults.standard.value(forKey: "current") as! Date?
                if ((current?.timeIntervalSinceNow)! >= TimeInterval(300)) {
                    amountTextField.text = ""
                }
                else {
                    amountTextField.text = UserDefaults.standard.value(forKey: "amount")as? String
                }
            }
            else {
                amountTextField.text = ""
            }
        }
        
        if (UserDefaults.standard.value(forKey: "selectedIndex") != nil) {
            let si = UserDefaults.standard.value(forKey: "selectedIndex")
            tipPercentControl.selectedSegmentIndex = si as! Int
            if (amountTextField.text != "") {
                let tipPercents = [0.18, 0.2,  0.22]
            
                let amount = Double(amountTextField.text!) ?? 0
                let tip = amount * tipPercents[tipPercentControl.selectedSegmentIndex]
            
                let total = tip + amount
            
                tipLabel.text = String(format: "$%.2f", tip)
                totalLabel.text = String(format: "$%.2f", total)
            }
            
        }
        else {
            UserDefaults.standard.setValue(0, forKey: "selectedIndex")
            tipPercentControl.selectedSegmentIndex = 0
        }
        
        if (UserDefaults.standard.value(forKey: "darkMode") != nil) {
            let dark = UserDefaults.standard.value(forKey: "darkMode")
            if (dark as! Bool) {
                tipPercentControl.tintColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                tipPercentControl.backgroundColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                tipLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                tipsLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                totalLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                totalsLabel.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                amountTextField.textColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                fieldsView.backgroundColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                self.view.backgroundColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
            }
            else {
                tipPercentControl.tintColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                tipPercentControl.backgroundColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                tipLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                tipsLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                totalLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                totalsLabel.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                amountTextField.textColor = #colorLiteral(red: 0.1826401651, green: 0.4074759483, blue: 0.1614411473, alpha: 1)
                fieldsView.backgroundColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
                self.view.backgroundColor = #colorLiteral(red: 0.5387149453, green: 0.9531397223, blue: 0.5696426034, alpha: 1)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func keyboardWillShow(notification:Notification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardSize.height
            screenSize = UIScreen.main.bounds.size
            screenHeight = screenSize.height
            if (amountTextField.text == "") {
                heightConstraint.constant = screenHeight - keyboardHeight
            }
            else {
                heightConstraint.constant = 88
            }
            
        }
    }
    
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var tipsLabel: UILabel!
    
    @IBOutlet weak var totalsLabel: UILabel!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipPercentControl: UISegmentedControl!
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        if (amountTextField.text?.characters.count == 1) {
            UIView.animate(withDuration: 0.1, animations: {
                self.heightConstraint.constant = 88
                self.view.layoutIfNeeded()
            })
        }
        let tipPercents = [0.18, 0.2,  0.22]
        
        let amount = Double(amountTextField.text!) ?? 0
        let tip = amount * tipPercents[tipPercentControl.selectedSegmentIndex]
        
        let total = tip + amount
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        if (amountTextField.text == "") {
            UIView.animate(withDuration: 0.2, animations: {
                self.heightConstraint.constant = self.screenHeight - self.keyboardHeight
                self.amountTextField.frame.size.height = self.heightConstraint.constant
                
                self.view.layoutIfNeeded()
            })
        }
        UserDefaults.standard.setValue(amountTextField.text, forKey: "amount")
        current = Date()
        UserDefaults.standard.setValue(current, forKey: "current")
    }
    
    @IBAction func onTapControl(_ sender: AnyObject) {
        let tipPercents = [0.18, 0.2,  0.22]
        
        let amount = Double(amountTextField.text!) ?? 0
        let tip = amount * tipPercents[tipPercentControl.selectedSegmentIndex]
        
        let total = tip + amount
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

        UserDefaults.standard.setValue(tipPercentControl.selectedSegmentIndex, forKey: "selectedIndex")
    }
    
}

