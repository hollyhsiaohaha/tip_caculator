//
//  TipCaculator.swift
//  tip_caculator
//
//  Created by hollyhsiao on 2023/2/1.
//

import Foundation

class TipCalculator{
    var amountBeforeTax: Double = 0
    var tipAmount: Double = 0
    var tipPercentage: Double = 0
    var totalAmount: Double = 0
    
    init(amountBeforeTax: Double, tipPercentage: Double) {
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func caculateTip() {
        tipAmount = amountBeforeTax * tipPercentage
        totalAmount = tipAmount + amountBeforeTax
    }
}
