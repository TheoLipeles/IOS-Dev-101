
import UIKit

class TipCalculator {
    
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


let tipCalc = TipCalculator(total: 108.0, taxPercent: 0.08)

tipCalc.printPossibleTips()

