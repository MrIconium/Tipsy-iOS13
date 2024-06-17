//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Mehmet Emrah Konya on 17.06.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController{
    
    var billPerPerson:Double?
    var splitVaule:Double?
    var tipValue:Double?
    
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var billText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoText.text = "Split between \(String(format: "%.0f", splitVaule!)) people, with \(String(format: "%.0f", tipValue!))% tip."
        billText.text = String(billPerPerson!)
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
