//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitValue: UILabel!
    @IBOutlet weak var billValue: UITextField!
    
    
    var tip:Double = 10
    var split:Double = 2
    var bill:Double = 0
    var finalValue:Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    @IBAction func tipButton(_ sender: UIButton) {
        if let tipString = sender.titleLabel?.text{
            if tipString == "0%" {
                tip = 0.0
                zeroPercentButton.isSelected = true
                tenPercentButton.isSelected = false
                twentyPercentButton.isSelected = false
            } else if tipString == "10%" {
                tip = 10.0
                zeroPercentButton.isSelected = false
                tenPercentButton.isSelected = true
                twentyPercentButton.isSelected = false
            } else {
                tip = 20.0
                zeroPercentButton.isSelected = false
                tenPercentButton.isSelected = false
                twentyPercentButton.isSelected = true
            }
        }
    }
    
    @IBAction func splitButton(_ sender: UIStepper) {
        split = sender.value
        splitValue.text = String(format: "%.0f", split)
    }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        if billValue.text != "" {
            bill = Double(billValue.text!)!
        }
        finalValue = bill*(1+tip/100)/split
        
        print(finalValue!)
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showResult"){
            let destinationVC = segue.destination as? ResultViewController
            
            destinationVC?.billPerPerson = finalValue
            destinationVC?.splitVaule = split
            destinationVC?.tipValue = tip
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
}

