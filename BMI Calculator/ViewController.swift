//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Sacha Behrend on 11/09/2019.
//  Copyright © 2019 Sacha Behrend. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var height: Double?
    var weight: Double?
    
    var bmi: Double? {
        get {
            guard
                // Indeholder weight og height ikke en værdi -> gå straks til else statement og returner nil. Ellers returner bmi.
                let bmiHeight = height,
                let bmiWeight = weight,
                height != 0 || weight != 0
                
                else {
                    bmiText.text = "Husk at udfylde højde og vægt!"
                    return nil
            }
            
            return bmiWeight / (bmiHeight * bmiHeight)
            
        }
    }
    
    @IBOutlet weak var heightTextBox: UITextField!
    
    @IBOutlet weak var weightTextBox: UITextField!
    
    @IBOutlet weak var bmiText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        if
            // Hvis heightTextBox og weightTextBox har værdier -> gør noget. Ellers print "halli hallo"
            let heightString = heightTextBox.text,
            let weightString = weightTextBox.text {
            
            height = NumberFormatter().number(from: heightString)?.doubleValue
            weight = NumberFormatter().number(from: weightString)?.doubleValue
            
        }
        updateBMILabel()
    }
    
    func updateBMILabel(){
        self.bmiText.text = ""
        if let bmiValue = self.bmi{
            self.bmiText.text = String(format: "%4.1f", bmiValue)
        }
    }
}



