//
//  TipCalculatorModel.swift
//  TipCalculatorNYCDA
//
//  Created by Theodore Lipeles on 2/9/15.
//  Copyright (c) 2015 Theodore Lipeles. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    let total: Double
    let taxPercent: Double
    let subtotal: Double
    
    init(total:Double, taxPercent:Double) {
        self.total = total
        self.taxPercent = taxPercent
        self.subtotal = total / (taxPercent + 1)
    }
    
    private func calcTipWithTipPercent(tipPercent:Double) ->Double {
        return self.subtotal * tipPercent
    }
    
    func printPossibleTips() ->[Int: Double] {
        let possibleTips = [0.15, 0.18, 0.20]
        
        var retVal = [Int: Double]()
        
        for possibleTip in possibleTips {
            let intPercent = Int(possibleTip * 100)
            
            retVal[intPercent] = calcTipWithTipPercent(possibleTip)
        }
        
        return retVal
    }
    
}
