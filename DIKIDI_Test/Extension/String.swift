//
//  String.swift
//  DIKIDI_Test
//
//  Created by Roman Shukailo on 14.04.2025.
//
import Foundation


extension String {
    func addRubleSign() -> String {
        self + " ₽"
    }
    
    func makeThousand() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        formatter.decimalSeparator = "."
        formatter.minimumFractionDigits = contains(".") ? 2 : 0
        formatter.maximumFractionDigits = 2
        
        
        if let number = Double(self.replacingOccurrences(of: ",", with: ".")) {
            return formatter.string(from: NSNumber(value: number)) ?? self
        }
        
        return self
    }
}
