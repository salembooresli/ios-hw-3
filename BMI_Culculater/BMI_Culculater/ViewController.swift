//
//  ViewController.swift
//  BMI_Culculater
//
//  Created by Salem Booresli on 9/28/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var weightField: UITextField!
    
    @IBOutlet weak var hightField: UITextField!
    
    @IBOutlet weak var CalculateButton: UIButton!
    
    @IBOutlet weak var showStatusLabel: UILabel!
    
    @IBOutlet weak var showBmiLabel: UILabel! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        CalculateButton.layer.cornerRadius = CalculateButton.frame.height / 4  }
    
    @IBAction func calculateButton(_ sender: UIButton) {
        
        BMI(hight: Double(hightField.text!)! , weight: Double(weightField.text!)!)
        
    }
    
    func BMI (hight:Double,weight:Double) {
      let BMI = weight / (hight * hight) 
        
        showBmiLabel.text = String(BMI)
        
        if BMI <= 18.5 {
            showStatusLabel.text = "Underweight💀"
        }
        else if BMI >= 18.5 &&  BMI <= 30.0 {
            showStatusLabel.text = "Normal weight👌"
        }
        else if BMI >= 30.1 && BMI <= 40.0 {
            showStatusLabel.text = "Overweight🙊"
        }
        else {
            showStatusLabel.text = "Obesity🐻"
        }
    }

}

