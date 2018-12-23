//
//  ViewController.swift
//  TipCalculator
//
//  Created by Michael Brennan on 15/02/2017.
//  Copyright © 2017 Michael Brennan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountLabel: UILabel!
    @IBOutlet weak var customTipPercentLabel1: UILabel!
    @IBOutlet weak var customTipPercentageSlider: UISlider!
    @IBOutlet weak var customTipPercentLabel2: UILabel!
    @IBOutlet weak var tip15Label: UILabel!
    @IBOutlet weak var total15Label: UILabel!
    @IBOutlet weak var tipCustomLabel: UILabel!
    @IBOutlet weak var totalCustomLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    let decimal100 = NSDecimalNumber(string: "100.0")
    let decimal15Percent = NSDecimalNumber(string: "0.15")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        inputTextField.becomeFirstResponder()
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let sliderValue = NSDecimalNumber(value: Int(customTipPercentageSlider.value)as Int)
        let customPersent = sliderValue / decimal100
        
        if sender is UISlider
        {
            customTipPercentLabel1.text = customPersent.formatAsPercent()
            customTipPercentLabel2.text = customTipPercentLabel1.text
        }
        
        if let inputString = inputTextField.text, !inputString.isEmpty
        {
            let billAmount = NSDecimalNumber(string: inputString) / decimal100
            if sender is UITextField
            {
                billAmountLabel.text = " " + billAmount.formatAsCurrency()
                let fifteanTip = billAmount * decimal15Percent
                tip15Label.text = fifteanTip.formatAsCurrency()
                total15Label.text = (billAmount + fifteanTip).formatAsCurrency()
            }
            let customTip = billAmount * customPersent
            tipCustomLabel.text = customTip.formatAsCurrency()
            totalCustomLabel.text = (billAmount + customTip).formatAsCurrency()
        }
        else
        {
            billAmountLabel.text = ""
            tip15Label.text = ""
            total15Label.text = ""
            tipCustomLabel.text = ""
            totalCustomLabel.text = ""
        }
    }
}

extension NSNumber
{
    func formatAsCurrency() -> String {
         return NumberFormatter.localizedString(from: self, number: NumberFormatter.Style.currency)
    }
    
    func formatAsPercent() -> String {
        return NumberFormatter.localizedString(from: self, number: NumberFormatter.Style.percent)
    }
}

func +(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber{
     return left.adding(right)
}

func *(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber{
      return left.multiplying(by:right)
}
        
func /(left: NSDecimalNumber, right: NSDecimalNumber) -> NSDecimalNumber{
     return left.dividing(by:right)
}
        










