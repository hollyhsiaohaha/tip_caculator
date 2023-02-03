//
//  ViewController.swift
//  tip_caculator
//
//  Created by hollyhsiao on 2023/2/1.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        amountBeforeTaxTextField.becomeFirstResponder()
    }
    
    
    @IBOutlet weak var amountBeforeTaxTextField: UITextField!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageSlider: UISlider!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    @IBOutlet weak var totalResultLabel: UILabel!
    @IBOutlet weak var eachPersonAmountLabel: UILabel!
    
    var tipCalculator =  TipCalculator(amountBeforeTax: 0, tipPercentage: 0.1)
    
    
    func calculateBill() {
        tipCalculator.tipPercentage = Double(tipPercentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (amountBeforeTaxTextField.text! as NSString).doubleValue
        tipCalculator.caculateTip()
        updateUI()
    }
    
    func updateUI() {
        totalResultLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount)
        let numberOfPeople: Double = Double(numberOfPeopleSlider.value)
        eachPersonAmountLabel.text = String(format: "$%0.2f", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    //MARK: - Target / Action
    
    
    @IBAction func tipSliderValueChanged(_ sender: UISlider) {
        tipPercentageLabel.text = String(format: "Tip: %02d%%", Int(tipPercentageSlider.value))
        calculateBill()
    }
    
    @IBAction func numberOfPeopleSliderValueChanged(_ sender: UISlider) {
        numberOfPeopleLabel.text = "Slit: \(Int(numberOfPeopleSlider.value))"
        calculateBill()
    }
    
    
    @IBAction func amountBeforeTaxTextfieldChanged(_ sender: UITextField) {
        calculateBill()
    }
}

